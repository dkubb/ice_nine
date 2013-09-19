# encoding: utf-8

shared_examples 'IceNine::Freezer::Range.deep_freeze' do
  it 'returns the object' do
    should be(value)
  end

  it 'freezes the object' do
    expect { subject }.to change(value, :frozen?).from(false).to(true)
  end

  it 'freeze the first element in the Range' do
    expect(subject.begin).to be_frozen
  end

  it 'freeze the last element in the Range' do
    expect(subject.end).to be_frozen
  end

  it 'freezes instance variables in the Range' do
    value.instance_eval { @a = '1' }
    expect(subject.instance_variable_get(:@a)).to be_frozen
  end
end
