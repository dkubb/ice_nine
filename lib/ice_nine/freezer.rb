# encoding: utf-8

module IceNine

  # The default class that handles freezing objects
  class Freezer

    # Configure const_get and const_defined? to not search ancestors
    SKIP_ANCESTORS = (RUBY_VERSION < '1.9' ? [] : [false]).freeze

    # Cache the Freezer classes returned for each type
    @freezer_cache = Hash.new do |cache, mod|
      cache[mod] = nil
      mod.ancestors.each do |ancestor|
        freezer = find(ancestor.name.to_s)
        break cache[mod] = freezer if freezer
      end
      cache[mod]
    end

    # Look up the Freezer descendant by object type
    #
    # @example
    #   freezer_class = IceNine::Freezer[mod]
    #
    # @param [Module] mod
    #
    # @return [Class<Freezer>]
    #
    # @api public
    def self.[](mod)
      @freezer_cache[mod]
    end

    # Find a Freezer descendant by name
    #
    # @param [String] name
    #
    # @return [Class<Freezer>]
    #   returned if a matching freezer is found
    # @return [nil]
    #   returned if no matching freezer is found
    #
    # @api private
    def self.find(name)
      freezer = name.split('::').reduce(self) do |mod, const|
        mod.const_lookup(const) or break mod
      end
      freezer if freezer < self  # only return a descendant freezer
    end

    private_class_method :find

    # Look up a constant in the namespace
    #
    # @param [String] namespace
    #
    # @return [Module]
    #   returned if a matching constant is found
    # @return [nil]
    #   returned if no matching constant is found
    #
    # @api private
    def self.const_lookup(namespace)
      if const_defined?(namespace, *SKIP_ANCESTORS)
        const_get(namespace, *SKIP_ANCESTORS)
      end
    end

    class << self
      protected :const_lookup
    end

  end # class Freezer
end # module IceNine
