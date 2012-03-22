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
    when Numeric, TrueClass, FalseClass, NilClass, Symbol
      object
    else
      freeze_by_type(object)
      Freezer.deep_freeze(object)
    end
  end

  # Handle freezing each type of object
  #
  # @param [Object] object
  #
  # @return [undefined]
  #
  # @todo split this up into separate classes that handle freezing each type
  #
  # @api private
  def self.freeze_by_type(object)
    case object
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
  end

  private_class_method :freeze_by_type

  class Freezer

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

  end # Freezer
end # IceNine
