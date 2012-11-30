require 'flex'
require 'rails'
require 'flex/rails/helper'
require 'flex/rails/logger'

if ::Rails.respond_to?(:version) && ::Rails.version.to_i >= 3
  require 'flex/rails/engine'
else
  Flex::Configuration.configure do |c|
    c.config_file = "#{RAILS_ROOT}/config/flex.yml"
    c.flex_dir    = "#{RAILS_ROOT}app/flex"
    c.debug       = RAILS_ENV == 'development'
  end
end
