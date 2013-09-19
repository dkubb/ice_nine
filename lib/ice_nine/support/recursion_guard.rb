# encoding: utf-8

module IceNine

  # Protect against infinite recursion
  class RecursionGuard

    # Initialize a recursion guard
    #
    # @return [undefined]
    #
    # @api public
    def initialize
      @object_ids = {}
    end

    # Guard against recursively calling a block with the same object
    #
    # @example
    #   recursion_guard = IceNine::RecursionGuard.new
    #   recursion_guard.guard(object_id) do
    #     logic_which_may_be_recursively_called_with_object_id(recursion_guard)
    #   end
    #
    # @param [Integer] caller_object_id
    #
    # @return [Object]
    #
    # @api public
    def guard(caller_object_id)
      return if @object_ids.key?(caller_object_id)
      @object_ids[caller_object_id] = nil
      yield
    end

  end # RecursionGuard
end # module IceNine
