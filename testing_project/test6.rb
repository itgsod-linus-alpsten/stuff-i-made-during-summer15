def hero_souls(floor,solomon)
	if floor%100 == 0
		return ((((floor-80)/25)**1.3)*(1+(0.05*solomon))).to_i
	elsif floor%5 == 0
		return (((((floor-80)/25)**1.3)*(1+(0.05*solomon))).to_i)/2
	else
		return 0
	end
end

result = 0
for i in 100..650
	result += hero_souls(i,20)
end
puts result