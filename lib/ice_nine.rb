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
    case object
    when Struct
      Freezer::Struct.deep_freeze(object)
    else
      Freezer[object.class].deep_freeze(object)
    end
  end

end # module IceNine
