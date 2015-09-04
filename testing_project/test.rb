def name(length=6)
	name = ""
	length.times do
		name += rand(97..122).chr
	end
	return name
end

#3.times do
#	puts name(6)
#end

def narrow(a,b)
	x = a < b ? b : a
	x += a <=> b
end

a = 4
b = 6
#p narrow(a,b)

x = (a < b ? b : a) #will get value of 'b'
p x #same value
p b #same value

p x.object_id #has the same object id
p b.object_id #has the same object id

#(a < b ? b : a) += 1		does not work even tho same id as b
b += 1 #works