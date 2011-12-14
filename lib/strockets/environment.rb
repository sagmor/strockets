module Strockets
  module Environment
    def self.included(base)
      base.send :alias_method, :initialize_without_stitch, :initialize
      base.send :alias_method, :initialize, :initialize_with_stitch
    end

    def initialize_with_stitch(*args)
      initialize_without_stitch(*args)

      self.register_bundle_processor 'application/javascript', Bundle
      self.register_postprocessor 'application/javascript', Processor
    end
  end
end

Sprockets::Environment.send :include, Strockets::Environment
