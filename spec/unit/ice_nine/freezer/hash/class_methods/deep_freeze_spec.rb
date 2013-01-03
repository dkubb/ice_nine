# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Hash, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a Hash object' do
    let(:value) { { Object.new => Object.new } }

    it 'returns the object' do
      should be(value)
    end

    it 'freezes the object' do
      expect { subject }.to change(value, :frozen?).from(false).to(true)
    end

    it 'freezes each key in the Hash' do
      subject.keys.select(&:frozen?).should == subject.keys
    end

    it 'freezes each value in the Hash' do
      subject.values.select(&:frozen?).should == subject.values
    end

    if RUBY_VERSION >= '1.9' and RUBY_ENGINE == 'rbx'
      it 'does not freeze the Hash state' do
        subject.instance_variable_get(:@state).should_not be_frozen
      end

      it 'does not freeze the Hash entries' do
        subject.instance_variable_get(:@entries).should_not be_frozen
      end
    end
  end
end
