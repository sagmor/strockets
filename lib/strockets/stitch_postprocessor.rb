module Strockets
  class StitchPostprocessor < Tilt::Template
    HEADER_PATTERN = Sprockets::DirectiveProcessor::HEADER_PATTERN
    DIRECTIVE_PATTERN = Sprockets::DirectiveProcessor::DIRECTIVE_PATTERN

    def prepare; end

    def evaluate(context, locals, &block)
      @context = context

      stitch? ? define : data
    end

    protected
      attr_reader :context

      def process_requires

      end

      def stitch?
        stitch = directive?

        if stitch.nil?
          stitch = Strockets.defaults_to_stitch?
          stitch = !stitch if exception?
        end

        stitch
      end

      def define
        context.require_asset "stitch"

        "\n#{ Strockets.namespace }.define({'#{
          context.logical_path 
        }': function(exports, require, module) {\n#{
          indent(data)
        }\n}});\n"
      end

      def exception?
        Strockets.stitch_exceptions.any?{ |e| e.match(context.pathname.to_s) }
      end

      def directive?
        header = context.pathname.read[HEADER_PATTERN, 0] || ""
        header.lines.each do |line|
          if directive = line[DIRECTIVE_PATTERN, 1]
            name, *args = Shellwords.shellwords(directive)
            if name == "stitch"
              case args.first
              when "true" then return true
              when "false" then return false
              end
            end
          end
        end

        nil
      end

      def indent(string)
        string.gsub(/$(.)/m, "\\1  ").strip
      end
  end
end

class Sprockets::DirectiveProcessor
  # This is just a placeholder to make Sprockets erase stitch directives
  def process_stitch_directive(arg)
  end
end
