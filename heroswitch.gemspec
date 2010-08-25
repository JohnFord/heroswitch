spec = Gem::Specification.new do |s|
  s.name = 'heroswitch'
  s.version = '1.0.0'
  s.author = "John Ford"
  s.email = "jwford@gmail.com"
  s.summary = "Easily switch between multiple heroku accounts."
  s.description = %{Switch between multiple Heroku accounts.}
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb'] + Dir['tasks/**/*.rb'] + %w[
	  PostInstall.txt         
	  Rakefile                
	  heroswitch.gemspec      
	  README.rdoc
	]
  s.require_path = 'lib'
  s.autorequire = 'heroswitch'
  s.has_rdoc = false
  s.homepage = "http://github.com/JohnFord/heroswitch"
	s.executables = ['heroswitch']
end
