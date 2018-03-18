lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name         =  'sorted-routes'
  s.version      =  "0.1.1"
  s.date         =  Time.now.utc.strftime("%Y-%m-%d")
  s.summary      =  'Sort out your routes!'
  s.description  =  'Displays rails routes in a sortable and searchable table in your browser.'

  s.authors      =  ['Scott Lenander']
  s.email        =  'sjlteacher@gmail.com'
  s.homepage     =  'https://github.com/SJl149/sorted-routes'

  s.add_dependency 'launchy', '~> 2.4'
  s.files        =  Dir.glob("{lib}/**/*") + %w(LICENSE README.md)
  s.license      =  'MIT'
  s.require_path = 'lib'

end
