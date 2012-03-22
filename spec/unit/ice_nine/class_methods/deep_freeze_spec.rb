# encoding: utf-8

require 'spec_helper'

describe IceNine, '.deep_freeze' do
  subject { IceNine.deep_freeze(value) }

  context 'with a freezable object' do
    let(:value) { 'string' }

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end
  end

  context 'with an Array' do
    let(:value) { %w[ a ] }

    it 'freezes the Array' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each element in the Array' do
      subject.select(&:frozen?).should == subject
    end
  end
end
