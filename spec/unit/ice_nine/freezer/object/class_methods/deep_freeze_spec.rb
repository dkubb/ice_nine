# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Object, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  shared_examples 'IceNine::Freezer::Object.deep_freeze' do
    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.to change(value, :frozen?).from(false).to(true)
    end

    it 'freezes the instance variables in the Object' do
      expect(subject.instance_variable_get(:@a)).to be_frozen
    end
  end

  context 'with an Object' do
    let(:value) { Object.new }

    before do
      value.instance_eval { @a = '1' }
    end

    context 'without a circular reference' do
      it_behaves_like 'IceNine::Freezer::Object.deep_freeze'
    end

    context 'with a circular reference' do
      before do
        value.instance_eval { @b = self }
      end

      it_behaves_like 'IceNine::Freezer::Object.deep_freeze'
    end
  end
end
