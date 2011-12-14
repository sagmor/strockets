module Strockets
  class Processor < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      if stitch? scope
        "\nrequire.define({'#{ scope.logical_path }': function(exports, require, module) {\n" +
        indent(data) +
        "\n}});\n"
      else
        data
      end
    end

    private
      def stitch?(scope)
        directive = File.open(scope.pathname){|f| f.readline}.downcase.gsub(/[^a-z\-]/,"")

        Strockets.stitch_by_default? ? directive != "no-stitch" : directive == "stitch"
      end

      def indent(string)
        string.gsub(/$(.)/m, "\\1  ").strip
      end
  end
end
