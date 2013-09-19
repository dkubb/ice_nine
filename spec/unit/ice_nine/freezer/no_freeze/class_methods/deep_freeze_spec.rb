# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer/no_freeze'

describe IceNine::Freezer::NoFreeze, '.deep_freeze' do
  let(:object) { described_class }
  let(:value)  { double('value') }

  shared_examples 'IceNine::Freezer::NoFreeze.deep_freeze' do
    it 'returns the object' do
      should be(value)
    end

    it 'does not freeze the object' do
      expect { subject }.to_not change(value, :frozen?).from(false)
    end
  end

  context 'with a recursion guard' do
    subject { object.deep_freeze(value, recursion_guard) }

    let(:recursion_guard) { double('recursion_guard') }

    it_behaves_like 'IceNine::Freezer::NoFreeze.deep_freeze'
  end

  context 'without a recursion guard' do
    subject { object.deep_freeze(value) }

    it_behaves_like 'IceNine::Freezer::NoFreeze.deep_freeze'
  end
end
