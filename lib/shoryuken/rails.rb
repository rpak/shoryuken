module Shoryuken
  module Rails
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load 'shoryuken/rails/tasks/inspect.rake'
      end
    end
  end
end