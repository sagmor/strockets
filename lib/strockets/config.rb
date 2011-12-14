module Strockets
  module Config
    def stitch_by_default?
      @stitch_by_default || false
    end

    def stitch_by_default!
      @stitch_by_default = true
    end
  end

  extend Config
end
