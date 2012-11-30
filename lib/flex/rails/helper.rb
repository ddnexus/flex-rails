module Flex
  module Rails
    module Helper
      extend self

      def after_initialize
        # we need to reload the flex API methods with the new variables
        Flex.reload!
        Manager.init_models
      end

    end
  end
end
