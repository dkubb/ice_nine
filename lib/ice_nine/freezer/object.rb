# encoding: utf-8

module IceNine
  class Freezer

    # A freezer class for handling Object instances
    class Object < self

      # Deep Freeze an object
      #
      # @example
      #   object = IceNine.deep_freeze(Object.new)
      #
      # @param [Object] object
      # @param [RecursionGuard] recursion_guard
      #
      # @return [Object]
      #
      # @api public
      def self.deep_freeze(object, recursion_guard = RecursionGuard.new)
        freeze_instance_variables(object, recursion_guard)
        object.freeze
      end

      # Handle freezing the object's instance variables
      #
      # @param [Object] object
      # @param [RecursionGuard] recursion_guard
      #
      # @return [undefined]
      #
      # @api private
      def self.freeze_instance_variables(object, recursion_guard)
        object.instance_variables.each do |ivar_name|
          IceNine.deep_freeze(
            object.instance_variable_get(ivar_name),
            recursion_guard
          )
        end
      end

      private_class_method :freeze_instance_variables

    end # class Object

    BasicObject = Object
  end # class Freezer
end # module IceNine
