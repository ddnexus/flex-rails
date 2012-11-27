module Flex
  module Rails
    class Logger < Flex::Logger

      def initialize(*)
        super
        self.formatter = proc do |severity, datetime, progname, msg|
          ::Rails.logger.send(severity.downcase.to_sym, flex_format(msg)) if Configuration.log.to_rails
          flex_format(msg) if Configuration.log.to_stdout
        end
      end


    end
  end
end
