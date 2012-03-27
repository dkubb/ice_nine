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
      #
      # @return [Object]
      #
      # @api public
      def self.deep_freeze(object)
        freeze_instance_variables(object)
        object.freeze
      end

      # Handle freezing the object's instance variables
      #
      # @param [Object] object
      #
      # @return [undefined]
      #
      # @api private
      def self.freeze_instance_variables(object)
        object.instance_variables.each do |ivar_name|
          IceNine.deep_freeze(object.instance_variable_get(ivar_name))
        end
      end

      private_class_method :freeze_instance_variables

    end # class Object
  end # class Freezer
end # module IceNine
