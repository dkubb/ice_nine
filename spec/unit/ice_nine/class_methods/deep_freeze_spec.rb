# encoding: utf-8

require 'spec_helper'
require 'ice_nine'

describe IceNine, '.deep_freeze' do
  subject { object.deep_freeze(value) }

  let(:object) { IceNine    }
  let(:value)  { Object.new }

  before do
    value.instance_eval { @a = '1' }
  end

  context 'when the object is not frozen' do
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

  context 'when the object is frozen' do
    before do
      value.freeze
    end

    it 'returns the object' do
      should be(value)
    end

    it 'does not freeze the object' do
      expect { subject }.should_not change(value, :frozen?).from(true)
    end

    it 'does not freeze the instance variables in the Object' do
      subject.instance_variable_get(:@a).should_not be_frozen
    end
  end
end

describe IceNine, '.no_freeze' do
  module Mocha; end
  module Foo; end

  let(:object) { IceNine }
  let(:value)  { Mocha }

  subject { object.no_freeze(*value) }

  context "with one constant args pass" do
    before do
      IceNine::Freezer.constants.should_not include(:Mocha)
    end

    it 'mark namespace like NoFreeze' do
      subject
      IceNine::Freezer.constants.should include(:Mocha)
    end

    after do
      IceNine::Freezer.send(:remove_const, :Mocha)
    end
  end

  context "with several namespace pass in args" do

    let(:value)  { [Mocha, Foo] }

    before do
      IceNine::Freezer.constants.should_not include(:Mocha)
      IceNine::Freezer.constants.should_not include(:Foo)
    end

    it 'mark namespace like NoFreeze' do
      subject
      IceNine::Freezer.constants.should include(:Mocha)
      IceNine::Freezer.constants.should include(:Foo)
    end

    after do
      IceNine::Freezer.send(:remove_const, :Mocha)
      IceNine::Freezer.send(:remove_const, :Foo)
    end

  end

end
