class RatingManager
  @k_factor = 20

  def self.expected_percentage(elo1, elo2)
    1.0 / ( 1.0 + ( 10.0 ** ((elo2.to_f - elo1.to_f) / 400.0) ) )
  end

  def self.update_ratings!(player1, player2, winner=1)

    percent = self.expected_percentage(player1.rating, player2.rating) 
    points = (percent * @k_factor.to_f).round

    case winner
    when 1
      player1.rating += (@k_factor - points)
      player2.rating -= (@k_factor - points)
    when 2
      player2.rating += points
      player1.rating -= points
    else
      difference = (@k_factor.to_f * (0.5 - percent)).round
      player1.rating += difference
      player2.rating -= difference
    end
  end
end