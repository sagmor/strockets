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

    def defaults_to_stitch?
      @defaults_to_stitch || true
    end
    alias_method :defaults_to_stitch, :defaults_to_stitch?

    def defaults_to_stitch=(default)
      @defaults_to_stitch = default
    end

    def stitch_exceptions
      @stitch_exceptions ||
        defaults_to_stitch? ? STITCH_EXCEPTIONS_ON_TRUE : STITCH_EXCEPTIONS_ON_FALSE
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
