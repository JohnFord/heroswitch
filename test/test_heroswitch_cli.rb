require File.join(File.dirname(__FILE__), "test_helper.rb")
require 'heroswitch/cli'

class TestHeroswitchCli < Test::Unit::TestCase
  def setup
    Heroswitch::CLI.execute(@stdout_io = StringIO.new, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end

	def test_truth
	  assert true
	end
  
end
