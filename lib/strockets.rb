require "strockets/version"
require "strockets/processor"
require "strockets/bundle"

module Strockets
  def self.enable(environment,options={})
    environment.register_bundle_processor 'application/javascript', Bundle

    if options[:stitch_all]
      environment.register_processor 'application/javascript', Processor
    else
      environment.register_engine '.stitch', Processor
    end
  end
end
