class Backup
	
	def initialize(backup)
		@id = backup[:id]
		@name = backup[:name]
		@last_backup = backup[:last_backup]
		@last_backup_url = backup[:last_backup_url]
	end

	# accessor methods
	def get_id
		@id
	end

	def get_name
		@name
	end

	def get_backup_time
		@last_backup
	end

	def get_backup_url
		@last_backup_url
	end
	
	def get_backup_url_link
		if @last_backup_url != ''
			return "<a href='/#{@last_backup_url}'>#{@last_backup}</a>"
		else
			return ""
		end
	end

	def set_backup_time=(time)
		@last_backup=time
	end
		
end
