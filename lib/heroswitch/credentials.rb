require "ftools"
module Heroswitch
  class Credentials
	  HEROKU_HOME = File.join ENV["HOME"], ".heroku"
		CREDENTIALS_FILE = "credentials"

		def self.show_credentials
		  credentials_path = File.join HEROKU_HOME, CREDENTIALS_FILE
		  if File.exists? credentials_path
		    credentials = `cat #{credentials_path}`.split "\n"
		    puts "\nYour active Heroku credentials are:\n\n"
		    puts credentials.first
		    puts '*' * credentials.last.size
		    puts "\n"
		  else
		    puts "ERROR: Heroku credentials not found!"
		  end
		end

		def self.list_credentials
			puts "\nYou have credentials files for the following accounts in\n"
			puts "#{HEROKU_HOME}\n\n"
			Dir[HEROKU_HOME+"/*."+CREDENTIALS_FILE].each do |file|
			  puts "  #{(File.basename file).gsub(/\.#{CREDENTIALS_FILE}/, "")}"
			end
			puts "\n"
		end

    def self.switch(account)
	    account_path = File.join HEROKU_HOME, account + '.' + CREDENTIALS_FILE
	    credentials_path = File.join HEROKU_HOME, CREDENTIALS_FILE
	    puts "\nSwitching to the \"#{account}\" Heroku account..."
	    if File.exists? account_path
				File.copy(account_path, credentials_path)
				print_reminder account
	    else
	      puts "ERROR: Heroku account credentials do not exist!"
	    end
		end

		def self.print_reminder(account)
			puts <<-OUT.gsub(/^        /,'')

        \033[31mRemember to add an entry in your ~/.ssh/config file like:\033[0m
          Host \033[33m#{account}\033[0m.heroku.com
          HostName heroku.com
          User git
          IdentityFile ~/.ssh/path/to/#{account}/account/private_key.identity
          IdentitiesOnly yes

        \033[31mAlso, use \033[33m#{account}.heroku.com\033[31m when setting up your heroku remote in git:\033[0m
          $ git remote add heroku git@\033[33m#{account}.heroku.com\033[0m:MyApp.git

			OUT
		end
	end
end
