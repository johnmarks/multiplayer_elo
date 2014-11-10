require 'spec_helper'

describe RatingManager  do

  it 'should update the ranking of the winner and loser' do
    winning_player = TestUser.new
    losing_player = TestUser.new

    RatingManager.update_ratings!(winning_player, losing_player, 1)
    expect(winning_player.rating).to eq(1510)
    expect(losing_player.rating).to eq(1490)

    RatingManager.update_ratings!(winning_player, losing_player, 1)
    expect(winning_player.rating).to eq(1519)
    expect(losing_player.rating).to eq(1481)

    RatingManager.update_ratings!(winning_player, losing_player, 0)
    expect(winning_player.rating).to eq(1518)
    expect(losing_player.rating).to eq(1482)

    winning_player.rating = 1500
    losing_player.rating = 2000
    RatingManager.update_ratings!(losing_player, winning_player, 2)
    expect(winning_player.rating).to eq(1519)
    expect(losing_player.rating).to eq(1981)

  end
end