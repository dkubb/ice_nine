# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer'
require 'ice_nine/freezer/enumerable'

describe IceNine::Freezer::Enumerable, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with an Enumerable object' do
    let(:value) { %w[a] }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each entry in the Enumerable' do
      subject.select(&:frozen?).should == subject
    end
  end
end
