# encoding: utf-8

module IceNine
  class Freezer
    class Range < self

      # Deep Freeze a Range
      #
      # @example
      #   range = IceNine.deep_freeze('a'..'z')
      #   range.begin.frozen?  # => true
      #   range.end.frozen?    # => true
      #
      # @param [Range] range
      #
      # @return [Range]
      #
      # @api public
      def self.deep_freeze(range)
        range.begin.freeze
        range.end.freeze
        super range
      end

    end # class Range
  end # class Freezer
end # module IceNine
