# encoding utf-8

require 'spec_helper'
require 'ice_nine'

RSpec.describe IceNine, 'module behavior' do
  it 'exposes methods on itself' do
    expect(subject).to respond_to(:deep_freeze)
    expect(subject).to respond_to(:deep_freeze!)
  end

  context 'included in a class' do
    subject { Class.new { |mod| mod.include IceNine }.new }

    it 'hides IceNine methods' do
      expect(subject).to_not respond_to(:deep_freeze)
      expect(subject).to_not respond_to(:deep_freeze!)
    end

    it 'makes IceNine methods available to the instance' do
      subject.instance_eval do
        def freeze_it
          deep_freeze(Object.new)
        end
      end
      expect(subject.freeze_it).to be_frozen
    end
  end
end
