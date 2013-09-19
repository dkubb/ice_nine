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
      #
      # @return [Range]
      #
      # @api public
      def self.deep_freeze(range)
        super
        IceNine.deep_freeze(range.begin)
        IceNine.deep_freeze(range.end)
        range
      end

    end # Range
  end # Freezer
end # IceNine
