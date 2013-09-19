# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class that does not freeze anything
    class NoFreeze < self

      # Pass through the object without freezing it
      #
      # @example
      #   object = IceNine::Freezer::NoFreeze.deep_freeze(object)
      #   object.frozen?  # => false
      #
      # @param [Object] object
      #
      # @return [Object]
      #
      # @api public
      def self.deep_freeze(object, *)
        object
      end

    end # class NoFreeze
  end # class Freezer
end # module IceNine
