# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Array, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  shared_examples 'IceNine::Freezer::Array.deep_freeze' do
    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.to change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each entry in the Array' do
      expect(subject.select(&:frozen?)).to eql(subject)
    end
  end

  context 'with an Array object' do
    let(:value) { %w[a] }

    context 'without a circular reference' do
      it_behaves_like 'IceNine::Freezer::Array.deep_freeze'
    end

    context 'with a circular reference' do
      before { value << value }

      it_behaves_like 'IceNine::Freezer::Array.deep_freeze'
    end
  end
end
