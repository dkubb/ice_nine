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
    object.freeze
  end

end # IceNine
