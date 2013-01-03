# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer'
require 'ice_nine/freezer/no_freeze'
require 'ice_nine/freezer/false_class'

describe IceNine::Freezer::FalseClass, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a false object' do
    let(:value) { false }

    it 'returns the object' do
      should be(value)
    end

    it 'does not freeze the object' do
      expect { subject }.to_not change(value, :frozen?).from(false)
    end
  end
end
