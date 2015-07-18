require 'rspec'

def points(line)
  if line[0] == '-'
    return 0
  end
  return line[0].ord - 48
end

describe 'BowlingGameShould' do

  it 'should return zero points when no drawn in a bowling line' do
    expect(points('---------------------')).to(eq(0))
  end

  it 'should return 1 points when the first bowl is the only drawn in a bowling line' do
    expect(points('1--------------------')).to(eq(1))
  end
end