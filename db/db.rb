DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/tif_server.db")
	class Database
	include DataMapper::Resource
	property :id, Serial
	property :name, Text, :required => true
	property :last_backup, DateTime
	property :last_backup_url, Text
	end
DataMapper.finalize.auto_upgrade!