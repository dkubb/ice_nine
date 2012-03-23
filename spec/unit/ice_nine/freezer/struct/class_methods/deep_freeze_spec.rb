# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer/struct'

describe IceNine::Freezer::Struct, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a Struct' do
    let(:value) { klass.new('1') }
    let(:klass) { Struct.new(:a) }

    it { should be(value) }

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each value in the Struct' do
      subject.values.select(&:frozen?).should == subject.values
    end
  end
end
