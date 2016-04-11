require './config/config.rb'
require 'sinatra'
require 'open3'
require 'data_mapper'
require './db/db.rb'
require './lib/tif-shared/backup.rb'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

def check_if_in_backups(database, backups)
	backups.each do |backup|
		if backup.get_name() == database
			return
		end
	end
	add_to_backups(database)
	return
end

def add_to_backups(database)
	Database.create(:name => database)
end

get '/' do
	return 'hello world'
end

get '/databases/' do
	backs = Database.all(:order => :name.asc)
	@backups = []
	backs.each do |back|
		new_backup = Backup.new(back)
		@backups.push(new_backup)
	end
	get_databases = "mysqlshow -u #{$DB_USER} -p#{$DB_PASS}"
	Open3.popen3(get_databases) do | stdin, stdout, stderr, wait_thr|
		result = stdout.read
		values = result.scan(/\| (.*?) \|/m)
		values.each_with_index do |value, index|
			value = value[0].strip
			if index > 1
				if value != 'mysql' && value != 'performance_schema'
					check_if_in_backups(value,@backups)
				end
			end
		end
	end

	erb :database_form
end

post '/databases/backup/' do
	database_id = params[:database]
	backup = Database.first(:id => database_id)
	uri = "backups/#{backup.name}.sql"
	command = "mysqldump -u #{$DB_USER} -p#{$DB_PASS} #{backup.name} > #{uri}"
	system(command)
	backup.last_backup = Time.now
	backup.last_backup_url = uri
	backup.save
	redirect '/databases/'
end

get '/backups/:file' do |file|
	file = File.join('./backups/', file) 
	send_file(file, :disposition => 'attachment', :filename => File.basename(file))
end