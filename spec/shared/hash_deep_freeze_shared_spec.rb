# encoding: utf-8

shared_examples 'IceNine::Freezer::Hash.deep_freeze' do
  it 'returns the object' do
    should be(value)
  end

  it 'freezes the object' do
    expect { subject }.to change(value, :frozen?).from(false).to(true)
  end

  it 'freezes each key in the Hash' do
    expect(subject.keys.select(&:frozen?)).to eql(subject.keys)
  end

  it 'freezes each value in the Hash' do
    expect(subject.values.select(&:frozen?)).to eql(subject.values)
  end

  it 'freezes instance variables in the Hash' do
    value.instance_eval { @a = '1' }
    expect(subject.instance_variable_get(:@a)).to be_frozen
  end

  if RUBY_VERSION >= '1.9' && RUBY_ENGINE == 'rbx'
    it 'does not freeze the Hash state' do
      expect(subject.instance_variable_get(:@state)).to_not be_frozen
    end

    it 'does not freeze the Hash entries' do
      expect(subject.instance_variable_get(:@entries)).to_not be_frozen
    end
  end
end
