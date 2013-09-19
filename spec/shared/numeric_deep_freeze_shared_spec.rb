# encoding: utf-8

shared_examples 'IceNine::Freezer::Numeric.deep_freeze' do
  it 'returns the object' do
    should be(value)
  end

  it 'does not freeze the object' do
    expect { subject }.to_not change(value, :frozen?).from(false)
  end
end
