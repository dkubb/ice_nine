# encoding: utf-8

module IceNine

  # Core Ruby extensions
  module CoreExt

    # Extend Object with deep freezing
    module Object

      # Deep freeze an object
      #
      # @example
      #   object = object.deep_freeze
      #
      # @return [self]
      #
      # @api public
      def deep_freeze
        IceNine.deep_freeze(self)
      end

    end # module Object
  end # module CoreExt
end # module IceNine

# Add Object#deep_freeze
Object.instance_eval { include IceNine::CoreExt::Object }
