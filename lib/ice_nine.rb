# encoding: utf-8

# Base IceNine module
module IceNine

  # Deep Freeze object
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
      freezer(object)
      object.freeze
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
  def self.freezer(object)
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

  private_class_method :freezer

end # IceNine
