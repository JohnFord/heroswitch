require 'optparse'

module Heroswitch
  class CLI
    def self.execute(stdout, arguments=[])

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          Switch easily between multiple heroku envinments.

          Usage: #{File.basename($0)} [options] [account]

          Omit the account name to show the current credentials.

          Options are:
        BANNER
        opts.separator ""
				#opts.on("-l", "--list", "List accounts and exit") { options[:list_credentials] = true }
				opts.on("-l", "--list", "List accounts and exit") { Heroswitch::Credentials.list_credentials; exit }
        opts.on("-h", "--help", "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)
        opts.banner = <<-BANNER.gsub(/^          /,'')
          Manage multiple Heroku accounts

          Usage: #{File.basename($0)} [options] [account]

          Options are:
        BANNER

      end

			account = ARGV[0]

			if account
			  Heroswitch::Credentials.switch account
			else
			  Heroswitch::Credentials.show_credentials
			end

    end
  end
end
