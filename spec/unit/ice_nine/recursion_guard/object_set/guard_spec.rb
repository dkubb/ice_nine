# encoding: utf-8

require 'spec_helper'
require 'ice_nine/support/recursion_guard'

describe IceNine::RecursionGuard::ObjectSet, '#guard' do
  let(:object)       { IceNine::RecursionGuard::ObjectSet.new }
  let(:object_arg1)  { 'similar_but_not_equal_id'             }
  let(:object_arg2)  { 'similar_but_not_equal_id'             }
  let(:return_value) { double('return_value')                 }

  context 'when the block is not recursive' do
    subject do
      object.guard(object_arg1) { return_value }
      object.guard(object_arg2) { return_value }
    end

    it 'returns the expected value' do
      should be(return_value)
    end
  end

  context 'when the block is recursive' do
    subject do
      object.guard(object_arg1) do
        object.guard(object_arg2) do
          expect(subject).to be(object_arg1)
          return_value
        end
        expect(subject).to be(object_arg1)
        return_value
      end
    end

    it 'returns the expected value' do
      should be(return_value)
    end
  end
end
