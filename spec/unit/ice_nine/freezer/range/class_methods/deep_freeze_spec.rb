# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Range, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with a Range' do
    let(:value) { 'a'..'z' }

    it { should be(value) }

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
end
