class RailsRtemap < Rails::Railtie

  rake_tasks do
    path = File.join(File.dirname(__FILE__), '../tasks/rtemap.rake')
    load path
  end
end
