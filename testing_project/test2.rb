def calc_max_dps(top, bot, aps)
	(((top+bot)/2.0)+53)*3.78*aps*1.16
end

puts calc_max_dps(22,66,1.5)