# encoding: utf-8

require 'spec_helper'
require 'ice_nine/freezer/no_freeze'

describe IceNine::Freezer::NoFreeze, '.deep_freeze' do
   subject { object.deep_freeze(value) }

  let(:object) { described_class }
  let(:value)  { stub('value')   }

  it { should be(value) }

  it 'does not freeze the object' do
    expect { subject }.should_not change(value, :frozen?).from(false)
  end
end
