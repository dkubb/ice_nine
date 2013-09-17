# encoding: utf-8

require 'set'

require 'ice_nine/support/recursion_guard'

require 'ice_nine/freezer'
require 'ice_nine/freezer/object'
require 'ice_nine/freezer/no_freeze'
require 'ice_nine/freezer/array'

require 'ice_nine/freezer/false_class'
require 'ice_nine/freezer/hash'
require 'ice_nine/freezer/hash/state'
require 'ice_nine/freezer/nil_class'
require 'ice_nine/freezer/module'
require 'ice_nine/freezer/numeric'
require 'ice_nine/freezer/range'
require 'ice_nine/freezer/rubinius'
require 'ice_nine/freezer/struct'
require 'ice_nine/freezer/symbol'
require 'ice_nine/freezer/true_class'

require 'ice_nine/version'

# Base IceNine module
module IceNine

  # Deep Freeze an object
  #
  # @example
  #   object = IceNine.deep_freeze(object)
  #
  # @param [Object] object
  # @param [RecursionGuard] recursion_guard
  #
  # @return [Object]
  #
  # @api public
  def self.deep_freeze(object, recursion_guard = RecursionGuard.new)
    return object if object.frozen?
    recursion_guard.guard(object.__id__) do
      Freezer[object.class].deep_freeze(object, recursion_guard)
    end
  end

end # module IceNine
