n = 11
cubes = []
until n > 30
	cubes << [(n ** 3),n]
	n += 1
end

def save_cubes(cubes)
	file = File.open("cubes.txt","w")
	cubes.each do |nmr|
		file.puts("#{nmr[0]},#{nmr[1]}")
	end
	file.close
end

def for_fun(nmr,n)
	return nmr < (n+10)**3 ? n/10 : for_fun(nmr,n+10)
end

def find_cube_root(cube_nmr)
	root = ""
	last_digit = cube_nmr%10
	root << for_fun(cube_nmr,10).to_s
	root << ([2,3,7,8].include?(last_digit) ? 10-last_digit : last_digit).to_s
	return root.to_i
end