# encoding: utf-8

# Base IceNine module
module IceNine

  # Deep Freeze an object
  #
  # @example
  #   object = IceNine.deep_freeze(object)
  #
  # @param [Object] object
  #
  # @return [Object]
  #
  # @api public
  def self.deep_freeze(object)
    case object
    when Numeric, TrueClass, FalseClass, NilClass
      return object  # do nothing
    when Array
      object.each(&:freeze)
    when Hash
      object.each { |key, value|
        key.freeze
        value.freeze
      }
    when Range
      object.begin.freeze
      object.end.freeze
    when Struct
      object.each(&:freeze)
    end
    Freezer[object.class].deep_freeze(object)
  end

  class Freezer

    # Under 1.9 configure const_get and const_defined?
    # to not search ancestors for constants
    SKIP_ANCESTORS = (RUBY_VERSION < '1.9' ? [] : [ false ]).freeze

    # Lookup the Freezer subclass by object type
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

    # A freezer class for handling Symbol objects
    class Symbol < self

      # Pass through the Symbol without freezing it
      #
      # @example
      #   symbol = IceNine.deep_freeze(:symbol)
      #   symbol.frozen?  # => false
      #
      # @param [Symbol] symbol
      #
      # @return [Symbol]
      #
      # @api public
      def self.deep_freeze(symbol)
        symbol
      end

    end # Symbol
  end # Freezer
end # IceNine
