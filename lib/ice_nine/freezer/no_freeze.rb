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
      def self.deep_freeze(object)
        object
      end

    end # class NoFreeze

    # A freezer class for handling nil objects
    class NilClass < NoFreeze; end

    # A freezer class for handling TrueClass objects
    class TrueClass < NoFreeze; end

    # A freezer class for handling FalseClass objects
    class FalseClass < NoFreeze; end

    # A freezer class for handling Symbol objects
    class Symbol < NoFreeze; end

  end # class Freezer
end # module IceNine
