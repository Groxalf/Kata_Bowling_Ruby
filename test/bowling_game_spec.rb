require 'rspec'
require_relative '../bowling_game'

def points(line)
  game = BowlingGame.new(line)
  game.points
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

  it 'should add the next throw when the previous is an spare' do
    expect(points('1---/4---------------')).to(eq(19))
  end

  it 'should add the next two throws when the previous is an strike' do
    expect(points('1---X45--------------')).to(eq(29))
  end
end