# encoding: utf-8

require 'spec_helper'
require 'ice_nine'
require 'delegate'

describe IceNine, '.fast_deep_freeze' do
  subject { object.fast_deep_freeze(value) }

  let(:object) { IceNine }

  context 'with a shallowly frozen value' do
    let(:value) { ['a', 'b'].freeze }

    it 'does not deep freeze' do
      expect(subject.select(&:frozen?)).to eql([])
    end
  end

  it_should_behave_like 'IceNine.deep_freeze'
end
