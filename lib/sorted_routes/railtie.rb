require 'sorted_routes'
require 'rails'

module SortedRoutes
  class Railtie < Rails::Railtie
    railtie_name :sorted_routes

    rake_tasks do
      path = File.join(File.dirname(__FILE__), '../tasks/sorted_routes.rake')
      load path
    end
  end
end
