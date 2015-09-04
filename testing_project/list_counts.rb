def is_even?(nr)
	("%b" % nr)[-1] == '0'
end

def sum(*numbers)
	numbers.inject(0) { |sum, n| sum + n }
end

def min(*numbers)
	return 0 if numbers.empty?
	numbers.inject{ |min, n| n < min ? n : min }
end

def max(*numbers)
	numbers.inject(0) { |max, n| n > max ? n : max }
end

def average(*numbers)
	return 0 if numbers.empty?
	sum(*numbers)/numbers.length.to_f
end

def median(*numbers)
	return 0 if numbers.empty?
	i = numbers.length
	return average(*numbers[(i/2)-1..(i/2)]) if is_even?(i)
	numbers[i/2]
end