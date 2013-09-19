# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class for handling Hash objects
    class Hash < Object

      # Deep Freeze a Hash
      #
      # @example
      #   hash = IceNine::Freezer::Hash.deep_freeze('a' => '1', 'b' => '2')
      #   hash.keys.select(&:frozen?)    # => ['a', 'b']
      #   hash.values.select(&:frozen?)  # => ['1', '2']
      #
      # @param [Hash] hash
      # @param [RecursionGuard] recursion_guard
      #
      # @return [Hash]
      #
      # @api public
      def self.deep_freeze(hash, recursion_guard = RecursionGuard.new)
        IceNine.deep_freeze(hash.default_proc || hash.default, recursion_guard)
        hash.each do |key, value|
          IceNine.deep_freeze(key, recursion_guard)
          IceNine.deep_freeze(value, recursion_guard)
        end
        super
      end

    end # class Hash
  end # class Freezer
end # module IceNine
