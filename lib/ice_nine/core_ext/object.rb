# encoding: utf-8

# Base class for every object in Ruby
class Object

  # Deep freeze an object
  #
  # @example
  #   object = object.deep_freeze
  #
  # @return [self]
  #
  # @api public
  def deep_freeze
    IceNine.deep_freeze(self)
  end

end # class Object
