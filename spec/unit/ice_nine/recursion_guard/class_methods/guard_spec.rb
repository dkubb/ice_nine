# encoding: utf-8

require 'spec_helper'
require 'ice_nine/support/recursion_guard'

describe IceNine::RecursionGuard, '#guard' do
  subject { object.guard(object_id, &method(:block)) }

  let(:object)       { IceNine::RecursionGuard.new }
  let(:object_id)    { 1                           }
  let(:return_value) { double('return_value')      }

  context 'when the block is not recursive' do
    def block
      return_value
    end

    it 'returns the expected value' do
      should equal(return_value)
    end
  end

  context 'when the block is recursive' do
    def block
      expect(subject).to be_nil
      return_value
    end

    it 'returns the expected value' do
      should equal(return_value)
    end
  end
end
