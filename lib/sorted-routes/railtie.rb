class RailsSortRoutes < Rails::Railtie
  VERSION = '0.0.0'

  rake_tasks do
    path = File.join(File.dirname(__FILE__), '../tasks/sort_routes.rake')
    load path
  end
end
