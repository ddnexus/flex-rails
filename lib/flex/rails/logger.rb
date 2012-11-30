module Flex
  module Rails
    class Logger < Flex::Logger

      attr_accessor :log_to_rails_logger, :log_to_stdout

      def initialize(*)
        super
        self.formatter = proc do |severity, datetime, progname, msg|
          flex_formatted = flex_format(severity, msg)
          ::Rails.logger.send(severity.downcase.to_sym, flex_formatted) if log_to_rails_logger
          flex_formatted if log_to_stdout
        end
        @log_to_rails_logger = true
        @log_to_stdout       = false
      end

    end
  end
end
