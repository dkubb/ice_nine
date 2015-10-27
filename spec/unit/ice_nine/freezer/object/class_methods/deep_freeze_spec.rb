# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine::Freezer::Object, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { described_class }

  context 'with an Object' do
    let(:value) { Object.new }

    context 'without a circular reference' do
      it_behaves_like 'IceNine::Freezer::Object.deep_freeze'
    end

    context 'with a circular reference' do
      before do
        value.instance_eval { @b = self }
      end

      it_behaves_like 'IceNine::Freezer::Object.deep_freeze'
    end
  end

  context 'with an Object which undefs :freeze' do
    let(:value) { UndefFreeze.new }

    before do
      klass = Class.new do
        undef :freeze
      end

      stub_const('UndefFreeze', klass)
    end

    it_behaves_like 'IceNine::Freezer::NoFreeze.deep_freeze'
  end
end
