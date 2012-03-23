# encoding: utf-8

module IceNine

  # The default class that handles freezing objects
  class Freezer

    # Configure const_get and const_defined? to not search ancestors
    SKIP_ANCESTORS = (RUBY_VERSION < '1.9' ? [] : [ false ]).freeze

    # Lookup the Freezer subclass by object type
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
      mod.ancestors.each do |ancestor|
        name = ancestor.name.to_s
        freezer = find(name) unless name.empty?  # skip anonymous modules
        return freezer if freezer
      end
    end

    # Deep Freeze an object
    #
    # @example
    #   object = IceNine.deep_freeze(Object.new)
    #
    # @param [Object] object
    #
    # @return [Object]
    #
    # @api public
    def self.deep_freeze(object)
      freeze_instance_variables(object)
      object.freeze
    end

    # Find a Freezer subclass by name
    #
    # @param [String] mod_name
    #
    # @return [Class<Freezer>]
    #
    # @api private
    def self.find(mod_name)
      namespace, const = mod_name.split('::', 2)
      mod = const_lookup(namespace) if namespace
      mod ? mod.find(const.to_s) : self
    end

    class << self
      protected :find
    end

    # Lookup a constant in the namespace
    #
    # @param [String] namespace
    #
    # @return [Module]
    #   returned if a matching freezer is found
    # @return [nil]
    #   returned if no matchiner freezer is found
    #
    # @api private
    def self.const_lookup(namespace)
      if const_defined?(namespace, *SKIP_ANCESTORS)
        const_get(namespace, *SKIP_ANCESTORS)
      end
    end

    private_class_method :const_lookup

    # Handle freezing the object's instance variables
    #
    # @param [Object] object
    #
    # @return [undefined]
    #
    # @api private
    def self.freeze_instance_variables(object)
      object.instance_variables.each do |ivar_name|
        IceNine.deep_freeze(object.instance_variable_get(ivar_name))
      end
    end

    private_class_method :freeze_instance_variables

  end # class Freezer
end # module IceNine
