# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class for handling Enumerable objects
    class Enumerable < Object

      # Deep Freeze an Enumerable
      #
      # @example
      #   enumerable = IceNine:Freezer::Enumerable.deep_freeze(%w[a b c])
      #   enumerable.select(&:frozen?)  # => ['a', 'b', 'c']
      #
      # @param [Enumerable] enumerable
      #
      # @return [Enumerable]
      #
      # @todo use super on #each when Struct#each returns self in Rubinius
      #
      # @api public
      def self.deep_freeze(enumerable)
        enumerable.each do |*args|
          args.each { |arg| IceNine.deep_freeze(arg) }
        end
        super enumerable
      end

    end # class Enumerable
  end # class Freezer
end # module IceNine
