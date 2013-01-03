# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer'
require 'ice_nine/freezer/no_freeze'
require 'ice_nine/freezer/symbol'

describe IceNine::Freezer::Symbol, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a Symbol object' do
    let(:value) { :symbol }

    it 'returns the object' do
      should be(value)
    end

    it 'does not freeze the object' do
      expect { subject }.to_not change(value, :frozen?).from(false)
    end
  end
end
