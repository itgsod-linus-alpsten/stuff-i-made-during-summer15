total_cost = 0
next_lvl = 51
limit = 60

until next_lvl > limit
	total_cost += (next_lvl**1.5).round
	next_lvl += 1
end

puts total_cost