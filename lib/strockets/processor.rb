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
        return false if scope.pathname.basename.to_s =~ /\.jst/ 

        directive = File.open(scope.pathname){|f| f.readline}.downcase.gsub(/[^a-z\-]/,"") rescue nil

        Strockets.compatibility_mode? ? directive == "stitch" : directive != "no-stitch"
      end

      def indent(string)
        string.gsub(/$(.)/m, "\\1  ").strip
      end
  end
end
