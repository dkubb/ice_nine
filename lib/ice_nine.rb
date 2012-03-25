# encoding: utf-8

require 'set'

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
    recursion_guard(object.object_id) do
      Freezer[object.class].deep_freeze(object)
    end
  end

  # Guard the system from recursive freezing
  #
  # @param [Integer] object_id
  #
  # @return [Object]
  #
  # @api private
  def self.recursion_guard(object_id)
    objects = current_objects
    return if objects.include?(object_id)
    begin
      objects << object_id
      yield
    ensure
      objects.delete(object_id)
    end
  end

  private_class_method :recursion_guard

  # The current objects being frozen in this thread
  #
  # @return [Set<Integer>]
  #
  # @api private
  def self.current_objects
    Thread.current[:__ice_nine_current_objects] ||= Set.new
  end

  private_class_method :current_objects

end # module IceNine
