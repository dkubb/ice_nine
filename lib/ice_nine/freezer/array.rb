# encoding: utf-8

module IceNine
  class Freezer
    class Array < self

      # Deep Freeze an Array
      #
      # @example
      #   array = IceNine.deep_freeze(%w[ a b c ])
      #   array.select(&:frozen?)  # => [ 'a', 'b', 'c' ]
      #
      # @param [Array] array
      #
      # @return [Array]
      #
      # @api public
      def self.deep_freeze(array)
        super array.each(&:freeze)
      end

    end # class Array
  end # class Freezer
end # module IceNine
