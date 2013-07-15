# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Struct, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a Struct' do
    let(:value) { klass.new('1') }
    let(:klass) { Struct.new(:a) }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.to change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each value in the Struct' do
      expect(subject.values.select(&:frozen?)).to eql(subject.values)
    end
  end
end
