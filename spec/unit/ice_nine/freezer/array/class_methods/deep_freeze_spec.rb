# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer'
require 'ice_nine/freezer/array'

describe IceNine::Freezer::Array, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with an Array object' do
    let(:value) { %w[ a ] }

    it { should be(value) }

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each element in the Array' do
      subject.select(&:frozen?).should == subject
    end
  end
end
