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

  context 'with a Numeric' do
    let(:value) { 1 }

    it 'does not freeze the Numeric' do
      expect { subject }.should_not change(value, :frozen?).from(false)
    end
  end

  context 'with a TrueClass' do
    let(:value) { true }

    it 'does not freeze the TrueClass' do
      expect { subject }.should_not change(value, :frozen?).from(false)
    end
  end

  context 'with a FalseClass' do
    let(:value) { false }

    it 'does not freeze the FalseClass' do
      expect { subject }.should_not change(value, :frozen?).from(false)
    end
  end

  context 'with a NilClass' do
    let(:value) { nil }

    it 'does not freeze the NilClass' do
      expect { subject }.should_not change(value, :frozen?).from(false)
    end
  end

  context 'with a Symbol' do
    let(:value) { :symbol }

    it 'does not freeze the Symbol' do
      expect { subject }.should_not change(value, :frozen?).from(false)
    end
  end
end
