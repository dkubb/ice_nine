# encoding: utf-8

shared_examples 'IceNine::Freezer::Array.deep_freeze' do
  it 'returns the object' do
    should be(value)
  end

  it 'freezes the object' do
    expect { subject }.to change(value, :frozen?).from(false).to(true)
  end

  it 'freezes each entry in the Array' do
    expect(subject.select(&:frozen?)).to eql(subject)
  end

  it 'freezes instance variables in the Array' do
    value.instance_eval { @a = '1' }
    expect(subject.instance_variable_get(:@a)).to be_frozen
  end
end
