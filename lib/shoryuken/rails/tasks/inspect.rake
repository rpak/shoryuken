desc "Inspects code base"

task inspect: :environment do
  all_routes = Rails.application.routes.routes

  if Rails.version >= "4"
    require 'action_dispatch/routing/inspector'
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    puts inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])
  else
    require 'rails/application/route_inspector'
    inspector = Rails::Application::RouteInspector.new
    puts inspector.format(all_routes, ENV['CONTROLLER']).join "\n"
  end
end