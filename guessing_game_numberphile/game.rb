def roll_uniq(range,prev_numbers)
	new_number = rand(range)
	roll_again = false
	prev_numbers.each do |number|
		if new_number == number
			roll_again = true
		end
	end
	if roll_again
		new_number = roll_uniq(range,prev_numbers)
	end
	return new_number
end

def roll_and_guess(range,set_difference=0)
	a = rand(range)
	unless set_difference == 0
		b = a + [set_difference,-set_difference].sample
		until b <= range
			b = a + [set_difference,-set_difference].sample
		end
	else
		b = roll_uniq(range,[a])
	end
	k = roll_uniq(range,[a])
	if a > b
		bigger = a
	else
		bigger = b
	end
	if a > k
		guess_bigger = a
	else
		guess_bigger = b
	end
	return {a:a,b:b,k:k,guess:bigger==guess_bigger}
end

def with_k(times)
	correct_guesses = 0
	times.times do
		results = yield
		if results[:guess]
			correct_guesses += 1
		end
	end
	return correct_guesses
end

def without_k(range,times)
	correct_guesses = 0
	times.times do
		a = rand(range)
		b = roll_uniq(range,[a])
		guess = [b,a][rand(1)]
		if a > b
			bigger = a
		else
			bigger = b
		end
		if guess == bigger
			correct_guesses += 1
		end
	end
	return correct_guesses
end

n = 10000
range = 1000000
puts "With K:"
puts "#{with_k(n){roll_and_guess(range)}}/#{n}"
puts "Without K:"
puts "#{without_k(range,n)}/#{n}"