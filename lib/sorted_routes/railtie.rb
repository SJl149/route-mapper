module SortedRoutes
  class Railtie < Rails::Railtie
    VERSION = '0.0.9'

    rake_tasks do
      load 'tasks/sorted_routes.rake'
    end
  end
end
