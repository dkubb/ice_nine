# encoding: utf-8

require 'ice_nine/freezer'
require 'ice_nine/freezer/array'
require 'ice_nine/freezer/hash'
require 'ice_nine/freezer/no_freeze'
require 'ice_nine/freezer/range'
require 'ice_nine/freezer/struct'

require 'ice_nine/version'

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
    recursion_guard(recursion_guard_key(object)) do
      Freezer[object.class].deep_freeze(object)
    end
    object
  end

  # Guard the system from recursive freezing
  #
  # @param [String] key
  #
  # @return [undefined]
  #
  # @api private
  def self.recursion_guard(key)
    thread = Thread.current
    return if thread[key]
    begin
      thread[key] = true
      yield
    ensure
      thread[key] = nil
    end
  end

  private_class_method :recursion_guard

  # Create a unique key to guard against recursively deep freezing the object
  #
  # @param [#object_id]
  #
  # @return [String]
  #
  # @api private
  def self.recursion_guard_key(object)
    "__ice_nine_deep_freeze_#{object.object_id}"
  end

  private_class_method :recursion_guard_key

end # module IceNine
