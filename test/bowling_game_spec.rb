require 'rspec'
require_relative '../bowling_game'

def points(line)
  game = BowlingGame.new(line)
  game.points
end

describe 'BowlingGameShould' do

  it 'should return zero points when no drawn in a bowling line' do
    expect(points('-- -- -- -- -- -- -- -- -- ---')).to(eq(0))
  end

  it 'should return 1 points when the first bowl is the only drawn in a bowling line' do
    expect(points('1- -- -- -- -- -- -- -- -- ---')).to(eq(1))
  end

  it 'should return 4 points when in the bowling line is more than one drawn bowl' do
    expect(points('13 -- -- -- -- -- -- -- -- ---')).to(eq(4))
  end

  it 'should return 9 points when there are more than one frame with drawn bowls' do
    expect(points('13 23 -- -- -- -- -- -- -- ---')).to(eq(9))
  end

  it 'should add the next throw when the previous is an spare' do
    expect(points('4/ 4- -- -- -- -- -- -- -- ---')).to(eq(18))
  end

  it 'should add the next two throws when the previous is an strike' do
    expect(points('X 45 -- -- -- -- -- -- -- ---')).to(eq(28))
  end

  it 'should add a spare and a spare when one follows the other' do
    expect(points('4/ X 45 -- -- -- -- -- -- ---')).to(eq(48))
  end

  it 'should add a two strikes when one follows the other' do
    expect(points('45 X X 45 -- -- -- -- -- ---')).to(eq(61))
  end

  it 'should add to a spare the last roll' do
    expect(points('11 11 11 11 11 11 11 11 11 1/4')).to(eq(32))
  end
end