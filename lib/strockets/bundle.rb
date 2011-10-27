module Strockets
  class Bundle < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      File.read(File.expand_path('../stitch.js',__FILE__)) + data
    end
  end
end

