# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer/no_freeze'

describe IceNine::Freezer::NoFreeze, '.deep_freeze' do
  let(:object) { described_class }
  let(:value)  { double('value') }

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
