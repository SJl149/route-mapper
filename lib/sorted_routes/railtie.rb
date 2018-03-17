class RailsSortedRoutes < Rails::Railtie
  VERSION = '0.0.7'

  rake_tasks do
    path = File.join(File.dirname(__FILE__), '../tasks/sorted_routes.rake')
    load path
  end
end
