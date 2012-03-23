# encoding: utf-8

module IceNine
  class Freezer
    class Hash < self

      # Deep Freeze a Hash
      #
      # @example
      #   hash = IceNine::Freezer::Hash.deep_freeze('a' => '1', 'b' => '2')
      #   hash.keys.select(&:frozen?)    # => [ 'a', 'b' ]
      #   hash.values.select(&:frozen?)  # => [ '1', '2' ]
      #
      # @param [Hash] hash
      #
      # @return [Hash]
      #
      # @api public
      def self.deep_freeze(hash)
        super hash.each { |key, value|
          key.freeze
          value.freeze
        }
      end

    end # class Hash
  end # class Freezer
end # module IceNine
