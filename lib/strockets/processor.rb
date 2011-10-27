module Strockets
  class Processor < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)

      "\nrequire.define({'#{ scope.logical_path }': function(exports, require, module) {\n" +
      indent(data) +
      "\n}});\n"
    end

    private
      def indent(string)
        string.gsub(/$(.)/m, "\\1  ").strip
      end
  end
end
