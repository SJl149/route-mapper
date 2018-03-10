require 'launchy'

task rtemap: :environment do
  output_file = File.join(Rails.root, 'tmp/routes.html')

  File.open(output_file, 'w') do |f|
    f.puts "<html><head><title>Rails routes</title>
             <style type='text/css'>
             body { background-color: #333; color: #01dad4; }
             </style></head>
             <body><table width='100%'><thead><tr><th>Name</th><th>Verb</th><th>Path</th><th>Requirements</th></tr></thead><tbody>"

    Rails.application.routes.routes.map do |route|
      unless route.requirements.empty?

        name = route.name.to_s
        verb = route.verb.inspect.gsub(/^.{2}|.{2}$/, "")
        path = route.path.spec.to_s
        controller = route.defaults[:controller].to_s
        action = route.defaults[:action].to_s

        f.puts "<tr><td>#{name}</td><td>#{verb}</td><td>#{path}</td><td>#{controller}&#35;#{action}</td></tr>"
      end
    end

    f.puts '</tbody></table></body></html>'

    puts "Generated routes to file://#{output_file}."
    unless ENV['background'] == 'true'
      Launchy.open("file://#{output_file}")
    end
  end
end
