# encoding: utf-8

module IceNine

  # Protect against infinite recursion
  module RecursionGuard

    # Guard against recursively calling a block with the same object
    #
    # @example
    #  IceNine::RecursionGuard.guard(object_id) do
    #    logic_which_may_recursively_call_the_containing_method
    #  end
    #
    # @param [Integer] object_id
    #
    # @return [Object]
    #
    # @api public
    def self.guard(object_id)
      objects = guarded_objects(caller.first)
      return if objects.include?(object_id)
      begin
        objects << object_id
        yield
      ensure
        objects.delete(object_id)
      end
    end

    # The current objects guarded at a specific location in the source
    #
    # @param [String] location
    #
    # @return [Set<Integer>]
    #
    # @api private
    def self.guarded_objects(location)
      Thread.current[location] ||= Set.new
    end

    private_class_method :guarded_objects

  end # RecursionGuard
end # module IceNine
