module Strockets
  module Config
    def compatibility_mode?
      @compatibility_mode || false
    end

    def compatibility_mode!
      @compatibility_mode = true
    end
  end

  extend Config
end
