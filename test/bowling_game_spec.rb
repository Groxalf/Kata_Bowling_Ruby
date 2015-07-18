require 'rspec'

  def points(line)
    0
  end

describe 'BowlingGameShould' do

  it 'should return zero points when no drawn in a bowling line' do
    expect(points('---------------------')).to(eq(0))
  end
end