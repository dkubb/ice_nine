# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer/no_freeze'

describe IceNine::Freezer::Numeric, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  [ 0.0, 0, 0x7fffffffffffffff ].each do |value|
    context "with a #{value.class} object" do
      let(:value) { value }

      it 'returns the object' do
        should be(value)
      end

      it 'does not freeze the object' do
        expect { subject }.should_not change(value, :frozen?).from(false)
      end
    end
  end
end
