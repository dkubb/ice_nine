# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class for handling Range objects
    class Range < Object

      # Deep Freeze a Range
      #
      # @example
      #   range = IceNine:Freezer::Range.deep_freeze('a'..'z')
      #   range.begin.frozen?  # => true
      #   range.end.frozen?    # => true
      #
      # @param [Range] range
      # @param [RecursionGuard] recursion_guard
      #
      # @return [Range]
      #
      # @api public
      def self.deep_freeze(range, recursion_guard = RecursionGuard.new)
        IceNine.deep_freeze(range.begin, recursion_guard)
        IceNine.deep_freeze(range.end, recursion_guard)
        super
      end

    end # class Range
  end # class Freezer
end # module IceNine
