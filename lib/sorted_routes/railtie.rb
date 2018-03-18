require 'sorted_routes'
require 'rails'

module SortedRoutes
  class Railtie < Rails::Railtie
    railtie_name :sorted_routes

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end
  end
end
