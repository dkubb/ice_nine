# encoding: utf-8

require 'set'

require 'ice_nine/support/recursion_guard'

require 'ice_nine/freezer'
require 'ice_nine/freezer/object'

require 'ice_nine/freezer/enumerable'
require 'ice_nine/freezer/hash'
require 'ice_nine/freezer/range'

require 'ice_nine/freezer/no_freeze'

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
    RecursionGuard.guard(object.object_id) do
      Freezer[object.class].deep_freeze(object)
    end
  end

end # module IceNine
