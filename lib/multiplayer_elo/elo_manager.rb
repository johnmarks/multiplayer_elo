class EloManager
	attr_accessor :k_factor

 	def initialize
		@k_factor = 20
	end

	def expected_percentage(elo1, elo2)
		1.0 / ( 1.0 + ( 10.0 ** ((elo2.to_f - elo1.to_f) / 400.0) ) )
	end

	# result is 0 for a loss 1 for a win or .5 for a tie
	def points_change(elo1, elo2, result)
		(@k_factor.to_f * (result.to_f - expected_percentage(elo1, elo2))).round
	end

	# format is an array of hashes with the keys :elo :id and :place (place is 1,2,3,4, etc)
	def evaulate_results(results)
		results.each do |i|
			elo_change = 0
			results.each do |j|
				next if i == j
				
				# we are using places so first place < 2nd place means a win
				if i[:place] > j[:place]
					winner = 0
				elsif i[:place] == j[:place]
					winner = 0.5
				else
					winner = 1
				end

				elo_change += points_change(i[:elo], j[:elo], winner)
			end

			i[:new_elo] = i[:elo] + elo_change
		end
	end
end