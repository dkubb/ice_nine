# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class for handling Array objects
    class Array < Object

      # Deep Freeze an Array
      #
      # @example
      #   array = IceNine:Freezer::Array.deep_freeze(%w[a b c])
      #   array.select(&:frozen?)  # => ['a', 'b', 'c']
      #
      # @param [Array] array
      # @param [RecursionGuard] recursion_guard
      #
      # @return [Array]
      #
      # @api public
      def self.deep_freeze(array, recursion_guard = RecursionGuard.new)
        array.each do |entry|
          IceNine.deep_freeze(entry, recursion_guard)
        end
        super
      end

    end # class Array
  end # class Freezer
end # module IceNine
