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
    when Numeric, TrueClass, FalseClass
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

  # The default class that handles freezing objects
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

    # A freezer class that does not freeze anything
    class NoFreeze < self

      # Pass through the object without freezing it
      #
      # @example
      #   object = IceNine::Freezer::NoFreeze.deep_freeze(object)
      #   object.frozen?  # => false
      #
      # @param [Object] object
      #
      # @return [Object]
      #
      # @api public
      def self.deep_freeze(object)
        object
      end

    end # class NoFreeze

    # A freezer class for handling nil objects
    class NilClass < NoFreeze; end

    # A freezer class for handling Symbol objects
    class Symbol < NoFreeze; end

  end # class Freezer
end # module IceNine
