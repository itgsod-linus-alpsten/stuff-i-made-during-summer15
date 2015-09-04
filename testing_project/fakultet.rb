def fakultet(tal)
	return 1 if tal == 0
	return tal*fakultet(tal-1)
end

puts fakultet(6)