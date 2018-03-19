require 'launchy'
require 'rake'

desc 'sorted_routes rake task'

task :sorted_routes => :environment do
  output_file = File.join(Rails.root, 'tmp/sorted_routes.html')

  File.open(output_file, 'w') do |f|
    f.puts "<html><head><title>Rails Sorted Routes</title>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <script src='https://code.jquery.com/jquery-1.12.4.js'></script>
            <script type='text/javascript' charset='utf8' src='https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js'></script>
            <script type='text/javascript'>
              $(document).ready(function() {
                  $('#sorted-routes').DataTable();
              });
            </script>
            <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css'>
            <style type='text/css'>
             body { background-color: #333; color: #01dad4; }
            </style></head>
            <body><table id='sorted-routes' class='display' width='100%'>
            <thead><tr><th>Name</th><th>Verb</th><th>Path</th><th>Requirements</th></tr></thead><tbody>"

    Rails.application.routes.routes.map do |route|
      unless route.requirements.empty?

        name = route.name.to_s
        verb = route.verb.inspect.gsub(/^.{2}|.{2}$/, "").to_s
        path = route.path.spec.to_s
        controller = route.defaults[:controller].to_s
        action = route.defaults[:action].to_s

        f.puts "<tr><td>#{name}</td><td>#{verb}</td><td>#{path}</td><td>#{controller}&#35;#{action}</td></tr>"
      end
    end

    f.puts '</tbody></table>
            </body></html>'

    puts "Generated routes to file://#{output_file}."
    Launchy.open("file://#{output_file}")
  end
end
