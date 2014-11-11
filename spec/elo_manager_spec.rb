require 'spec_helper'

describe EloManager do
  before(:all) do 
    @elo_manager = EloManager.new
  end

  it 'should have a default k-factor of 20' do
    expect(@elo_manager.k_factor).to eq(20)
  end

  it 'should have a method to predict the chance of a player to win' do
    expect(@elo_manager.expected_percentage(1500,1500)).to eq (0.5)
    expect(@elo_manager.expected_percentage(2000,1500)).to be > (0.94)
    expect(@elo_manager.expected_percentage(2000,1500)).to be < (0.95)
    expect(@elo_manager.expected_percentage(1500,2000)).to be > (0.05)
    expect(@elo_manager.expected_percentage(1500,2000)).to be < (0.06)
    expect(@elo_manager.expected_percentage(1500,1600)).to be > (0.24)
  end

  it 'should have a method which tells you the points change for 2 elos' do
    expect(@elo_manager.points_change(1500,1500, 1)).to eq(10)
    expect(@elo_manager.points_change(1510,1490, 1)).to eq(9)
    expect(@elo_manager.points_change(1500,2000, 1)).to eq(19)
    expect(@elo_manager.points_change(1500,1500, 0)).to eq(-10)
    expect(@elo_manager.points_change(1500,1500, 0.5)).to eq(0)
  end

  it 'should have a method which returns the new elo in the result' do
    game_results = [{id: 1, elo: 1500, place: 1}, {id: 2, elo: 1500, place: 2}]
    results = @elo_manager.evaulate_results(game_results)
    expect(results[0].keys).to eq([:id, :elo, :place, :new_elo])
    expect(results[0][:new_elo]).to eq(1510)
    expect(results[1][:new_elo]).to eq(1490)
  end

  it 'should support multiple players' do
    players = [ {id: 1, elo: 1500, place: 1}, {id: 2, elo: 1500, place: 2}, 
                {id: 3, elo: 1500, place: 3}, {id: 4, elo: 1500, place: 4} ]

    results = @elo_manager.evaulate_results(players)

    expect(results[0][:new_elo]).to eq(1530)
    expect(results[1][:new_elo]).to eq(1510)
    expect(results[2][:new_elo]).to eq(1490)
    expect(results[3][:new_elo]).to eq(1470)
  end

  it 'should support ties' do
    players = [ {id: 1, elo: 1500, place: 1}, {id: 2, elo: 1500, place: 2}, 
                {id: 3, elo: 1500, place: 2}, {id: 4, elo: 1500, place: 3} ]

    results = @elo_manager.evaulate_results(players)

    expect(results[0][:new_elo]).to eq(1530)
    expect(results[1][:new_elo]).to eq(1500)
    expect(results[2][:new_elo]).to eq(1500)
    expect(results[3][:new_elo]).to eq(1470)
  end

end