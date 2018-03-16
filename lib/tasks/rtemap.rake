require 'launchy'

task rtemap: :environment do
  output_file = File.join(Rails.root, 'tmp/routes.html')

  File.open(output_file, 'w') do |f|
    f.puts "<html><head><title>Rails routes</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css'>
             <style type='text/css'>
             body { background-color: #333; color: #01dad4; }
             </style></head>
             <body><table id='route-map' class='display' width='100%'>
             <thead><tr><th>Name</th><th>Verb</th><th>Path</th><th>Requirements</th></tr></thead><tbody>"

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

    f.puts '</tbody></table>
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
            <script>$(document).ready(function() {
                        $("#route-map").DataTable();
                    } );</script>
            </body></html>'

    puts "Generated routes to file://#{output_file}."
    Launchy.open("file://#{output_file}")
  end
end
