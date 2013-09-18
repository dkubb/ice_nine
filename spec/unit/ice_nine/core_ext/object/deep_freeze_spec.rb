# encoding: utf-8

require 'spec_helper'
require 'ice_nine'
require 'ice_nine/core_ext/object'

describe IceNine::CoreExt::Object, '#deep_freeze' do
  subject { object.deep_freeze }

  let(:object) { Object.new.extend(IceNine::CoreExt::Object) }

  it 'returns the object' do
    should be(object)
  end

  it 'freezes the object' do
    expect { subject }.to change(object, :frozen?).from(false).to(true)
  end
end
