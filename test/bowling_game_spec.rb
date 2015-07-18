require 'rspec'

def points(line)
  result = 0
  line.each_char do | char |
    if char == '-'
      result += 0
    else
      result += char.ord - 48
    end
  end
  result
end

describe 'BowlingGameShould' do

  it 'should return zero points when no drawn in a bowling line' do
    expect(points('---------------------')).to(eq(0))
  end

  it 'should return 1 points when the first bowl is the only drawn in a bowling line' do
    expect(points('1--------------------')).to(eq(1))
  end

  it 'should return 4 points when in the bowling line is more than one drawn bowl' do
    expect(points('1---3----------------')).to(eq(4))
  end
end