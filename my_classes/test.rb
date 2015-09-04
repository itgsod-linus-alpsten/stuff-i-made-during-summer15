def one
	puts 1
end

def two(arg)
	puts arg
end

def three(*args)
	args.each {|item|puts item}
end

a = [method(:one),method(:two),method(:three)]
args = {two:[2],three:[1,2,3]}

def call_all(meth,args)
	meth.each do |funct|
		funct.call(*args[funct.name])
	end
end

call_all(a,args)