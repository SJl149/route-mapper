lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'sorted_routes/version'

Gem::Specification.new do |s|
  s.name         =  'sorted_routes'
  s.version      =  SortedRoutes::VERSION
  s.date         =  Time.now.utc.strftime("%Y-%m-%d")
  s.summary      =  'Sort out your routes!'
  s.description  =  'Displays rails routes in a sortable and searchable table in your browser.'

  s.authors      =  ['Scott Lenander']
  s.email        =  'sjlteacher@gmail.com'
  s.homepage     =  'https://github.com/SJl149/sorted-routes'

  s.add_dependency 'launchy', '~> 2.4'
  s.files        =  Dir['{lib}/**/*', 'LICENSE', 'README.md']
  s.license      =  'MIT'
  s.require_path = 'lib'

end
