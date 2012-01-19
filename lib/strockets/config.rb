module Strockets
  module Config
    STITCH_EXCEPTIONS_ON_TRUE = [%r[/application.js], %r[/vendor/], %r[/gems/]]
    STITCH_EXCEPTIONS_ON_FALSE = []

    def namespace
      @namespace || "require"
    end

    def namespace=(namespace)
      @namespace = namespace
    end

    def default_to_stitch?
      @default_to_stitch || true
    end
    alias_method :default_to_stitch, :default_to_stitch?

    def default_to_stitch=(default)
      @stitch_by_default = default
    end

    def stitch_exceptions
      @stitch_exceptions ||
        default_to_stitch? ? STITCH_EXCEPTIONS_ON_TRUE : STITCH_EXCEPTIONS_ON_FALSE
    end

    def stitch_exceptions=(stitch_exceptions)
      @stitch_exceptions = stitch_exceptions
    end

    def stitch_path
      File.expand_path("../assets",__FILE__)
    end
  end

  extend Config
end
