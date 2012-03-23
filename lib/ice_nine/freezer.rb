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
      name = mod.name.to_s
      if name.length.nonzero? and const_defined?(name, *SKIP_ANCESTORS)
        const_get(name, *SKIP_ANCESTORS)
      else
        self
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

    # Handle freezing the object's instance variables
    #
    # @param [Object] object
    #
    # @return [undefined]
    #
    # @api private
    def self.freeze_instance_variables(object)
      object.instance_variables.each do |ivar_name|
        object.instance_variable_get(ivar_name).freeze
      end
    end

    private_class_method :freeze_instance_variables

  end # class Freezer
end # module IceNine
