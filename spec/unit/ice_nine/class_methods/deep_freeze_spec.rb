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

  context 'with a Hash' do
    let(:value) { { Object.new => Object.new } }

    it 'freezes the Hash' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each key in the Hash' do
      subject.keys.select(&:frozen?).should == subject.keys
    end

    it 'freezes each value in the Hash' do
      subject.values.select(&:frozen?).should == subject.values
    end
  end

  context 'with a Range' do
    let(:value) { 'a'..'z' }

    it 'freezes the Range' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freeze the first object in the Range' do
      subject.begin.should be_frozen
    end

    it 'freeze the last object in the Range' do
      subject.end.should be_frozen
    end
  end

  context 'with a Struct' do
    let(:value) { klass.new('1') }
    let(:klass) { Struct.new(:a) }

    it 'freezes the Struct' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each value in the Struct' do
      subject.values.select(&:frozen?).should == subject.values
    end
  end

  [ 0.0, 0, 0x7fffffffffffffff, true, false, nil, :symbol ].each do |value|
    context "with a #{value.class}" do
      let(:value) { value }

      it 'does not freeze the value' do
        expect { subject }.should_not change(value, :frozen?).from(false)
      end
    end
  end
end
