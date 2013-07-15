# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Hash, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a Hash object having a default proc' do
    let(:value) do
      Hash.new {}.update(Object.new => Object.new)
    end

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.to change(value, :frozen?).from(false).to(true)
    end

    it 'freezes the default proc' do
      expect(subject.default_proc).to be_frozen
    end

    it 'freezes each key in the Hash' do
      expect(subject.keys.select(&:frozen?)).to eql(subject.keys)
    end

    it 'freezes each value in the Hash' do
      expect(subject.values.select(&:frozen?)).to eql(subject.values)
    end

    if RUBY_VERSION >= '1.9' and RUBY_ENGINE == 'rbx'
      it 'does not freeze the Hash state' do
        expect(subject.instance_variable_get(:@state)).to_not be_frozen
      end

      it 'does not freeze the Hash entries' do
        expect(subject.instance_variable_get(:@entries)).to_not be_frozen
      end
    end
  end

  context 'with a Hash object having a default value' do
    let(:value) do
      Hash.new('').update(Object.new => Object.new)
    end

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.to change(value, :frozen?).from(false).to(true)
    end

    it 'freezes the default value' do
      expect(subject.default).to be_frozen
    end

    it 'freezes each key in the Hash' do
      expect(subject.keys.select(&:frozen?)).to eql(subject.keys)
    end

    it 'freezes each value in the Hash' do
      expect(subject.values.select(&:frozen?)).to eql(subject.values)
    end

    if RUBY_VERSION >= '1.9' and RUBY_ENGINE == 'rbx'
      it 'does not freeze the Hash state' do
        expect(subject.instance_variable_get(:@state)).to_not be_frozen
      end

      it 'does not freeze the Hash entries' do
        expect(subject.instance_variable_get(:@entries)).to_not be_frozen
      end
    end
  end
end
