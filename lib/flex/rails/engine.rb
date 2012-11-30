module Flex
  module Rails
    class Engine < ::Rails::Engine

      ActiveSupport.on_load(:before_configuration) do
        config.flex = C11n
        config.flex.variables[:index] = [self.class.name.split('::').first.underscore, ::Rails.env].join('_')
        config.flex.config_file       = ::Rails.root.join('config', 'flex.yml').to_s
        config.flex.flex_dir          = ::Rails.root.join('app', 'flex').to_s
        config.flex.logger            = Logger.new(STDOUT)
        config.flex.logger.level      = ::Logger::DEBUG if ::Rails.env.development?
      end

      ActiveSupport.on_load(:after_initialize) do
        Helper.after_initialize
      end

      rake_tasks do
        Utils.load_tasks
        Backup.load_tasks if defined?(Flex::Backup)
      end

      console do
        config.flex.logger.log_to_rails_logger = false
        config.flex.logger.log_to_stdout       = true
      end

      config.to_prepare do
        Flex.reload!
      end

    end
  end
end
