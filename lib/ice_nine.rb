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
    when Array
      object.each(&:freeze).freeze
    when Hash
      object.each { |key, value|
        key.freeze
        value.freeze
      }.freeze
    else
      object.freeze
    end
  end

end # IceNine
