# encoding: utf-8

require 'spec_helper'

describe IceNine::Freezer, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with an Object' do
    let(:value) { Object.new }

    before do
      value.instance_eval { @a = '1' }
    end

    it 'freezes the object' do
      expect { subject }.should change(value, :frozen?).from(false).to(true)
    end

    it 'freezes the instance variables in the Object' do
      subject.instance_variable_get(:@a).should be_frozen
    end
  end
end
