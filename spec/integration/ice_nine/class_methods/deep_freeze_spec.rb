# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { IceNine }

  context 'with an Object' do
    let(:value) { Object.new }

    before do
      value.instance_eval { @a = '1' }
    end

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes the instance variables in the Object' do
      subject.instance_variable_get(:@a).should be_frozen
    end

    context 'with a circular reference' do
      before do
        value.instance_eval { @self = self }
      end

      it 'returns the object' do
        should be(value)
      end

      it 'freezes the object' do
        expect { subject }.should change(value, :frozen?).from(false).to(true)
      end

      it 'freezes the instance variables in the Object' do
        subject.instance_variable_get(:@a).should be_frozen
      end
    end
  end

  context 'with an Array' do
    let(:value) { %w[a] }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each element in the Array' do
      subject.select(&:frozen?).should == subject
    end

    context 'with a circular reference' do
      before do
        value << value
      end

      it 'returns the object' do
        should be(value)
      end

      it 'freezes the object' do
        expect { subject }.should change(value, :frozen?).from(false).to(true)
      end

      it 'freezes each element in the Array' do
        subject.select(&:frozen?).should == subject
      end
    end
  end

  context 'with a Hash' do
    let(:value) { { Object.new => Object.new } }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each key in the Hash' do
      subject.keys.select(&:frozen?).should == subject.keys
    end

    it 'freezes each value in the Hash' do
      subject.values.select(&:frozen?).should == subject.values
    end

    context 'with a circular reference' do
      before do
        value[value] = value
      end

      it 'returns the object' do
        should be(value)
      end

      it 'freezes the object' do
        expect { subject }.should change(value, :frozen?).from(false).to(true)
      end

      it 'freezes each key in the Hash' do
        subject.keys.select(&:frozen?).should == subject.keys
      end

      it 'freezes each value in the Hash' do
        subject.values.select(&:frozen?).should == subject.values
      end
    end
  end

  context 'with a Range' do
    let(:value) { 'a'..'z' }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freeze the first object in the Range' do
      subject.begin.should be_frozen
    end

    it 'freeze the last object in the Range' do
      subject.end.should be_frozen
    end
  end

  context 'with a String' do
    let(:value) { '' }

    before do
      value.instance_eval { @a = '1' }
    end

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes the instance variables in the String' do
      subject.instance_variable_get(:@a).should be_frozen
    end

    context 'with a circular reference' do
      before do
        value.instance_eval { @self = self }
      end

      it 'returns the object' do
        should be(value)
      end

      it 'freezes the object' do
        expect { subject }.should change(value, :frozen?).from(false).to(true)
      end

      it 'freezes the instance variables in the String' do
        subject.instance_variable_get(:@a).should be_frozen
      end
    end
  end

  context 'with a Struct' do
    let(:value) { klass.new(%w[ 1 2 ]) }
    let(:klass) { Struct.new(:a)       }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each value in the Struct' do
      subject.values.select(&:frozen?).should == subject.values
    end

    context 'with a circular reference' do
      before do
        value.a = value
      end

      it 'returns the object' do
        should be(value)
      end

      it 'freezes the object' do
        expect { subject }.should change(value, :frozen?).from(false).to(true)
      end

      it 'freezes each value in the Struct' do
        subject.values.select(&:frozen?).should == subject.values
      end
    end
  end

  [0.0, 0, 0x7fffffffffffffff, true, false, nil, :symbol].each do |value|
    context "with a #{value.class}" do
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

describe IceNine, 'no_freeze' do
  module Mocha;
    class Object; end
  end

  let(:object) { IceNine }
  let(:value)  { Mocha }

  subject { object.no_freeze(value) }

  it 'avoid freeze class in this namespace' do
    subject
    IceNine.deep_freeze(Mocha::Object.new).should_not be_frozen
  end

  after do
    IceNine::Freezer.send(:remove_const, :Mocha)
  end
end
