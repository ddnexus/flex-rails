module Flex
  module Rails
    class Engine < ::Rails::Engine

      ActiveSupport.on_load(:before_configuration) do
        config.flex = Flex::Configuration
        config.flex.variables[:index] = [self.class.name.split('::').first.underscore, ::Rails.env].join('_')
        config.flex.config_file       = ::Rails.root.join('config', 'flex.yml').to_s
        config.flex.flex_dir          = ::Rails.root.join('app', 'flex').to_s
        config.flex.debug             = ::Rails.env.development?
      end

      ActiveSupport.on_load(:after_initialize) do
        Helper.after_initialize
      end

      rake_tasks do
        Flex::Utils.load_tasks
      end

      config.to_prepare do
        Flex.reload!
      end

    end
  end
end
