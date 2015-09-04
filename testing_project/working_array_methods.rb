#i'm making a function/functions to work in an array and use §index to refer to objects in current working array
#similar to working in a directory in the command prompt

array = [0,1,2,3,4,5]

def working_in(array)
	@a = array
	yield
end

def ca(index)
	return @a[index]
end

working_in array do
	puts ca(1) + 1
end