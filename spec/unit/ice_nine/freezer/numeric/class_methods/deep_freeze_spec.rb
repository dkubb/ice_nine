# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer'
require 'ice_nine/freezer/no_freeze'
require 'ice_nine/freezer/numeric'

describe IceNine::Freezer::Numeric, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  [0.0, 0, 0x7fffffffffffffff].each do |value|
    context "with a #{value.class} object" do
      let(:value) { value }

      it_behaves_like 'IceNine::Freezer::Numeric.deep_freeze'
    end
  end
end
