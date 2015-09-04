#a Sequence can contain methods which takes 1 or more arguments

class Sequence
	def initialize(array)
		if array.class != Array
			raise ArgumentError, 'expected Array as argument'
		end
		array.each do |item|
			if item.class != Method
				raise ArgumentError, 'expected Array containing Methods as argument'
			end
		end
		@sequence = array
		@seq_dict = {}
		@sequence.each_with_index do |item,index|
			@seq_dict[item.name] = index
		end
	end

	def update_dict
		@sequence.each_with_index do |item,index|
			@seq_dict[item.name] = index
		end
	end

	def call_all(*args)
		@sequence.each do |item|
			item.call(*args.shift(item.arity))
		end
	end

	def call_all2(args)
		@sequence.each do |item|
			item.call(*args[item.name])
		end
	end

	def call(symbol,*args)
		if symbol.class == Symbol
			method = symbol
		elsif symbol.class == String
			method = symbol.to_sym
		else
			raise ArgumentError, 'expected Symbol or String as argument'
		end
		@sequence[@seq_dict[method]].call(*args)
	end

	def add(method)
		if method.class != Method
			raise ArgumentError, 'expected Method as argument'
		end
		@sequence << method
		@seq_dict[method.name] = @sequence.length - 1
	end

	def remove(symbol)
		if symbol.class != Symbol and symbol.class != String
			raise ArgumentError, 'expected Symbol or String as argument'
		end
		if symbol.class == String
			method = symbol.to_sym
		else
			method = symbol
		end
		unless @seq_dict.has_key?(method)
			raise ArgumentError, "could not find #{method.to_s} in sequence"
		end
		@sequence.delete_at(@seq_dict[method])
		@seq_dict.delete(method)
		update_dict
	end

	def methods
		@sequence.collect{|item|item.name}
	end
end

def one(a,b)
	puts a+b
end

def two
	puts 2
end

def three(a)
	puts a
end

#methods = [method(:one),method(:two)]
#seq = Sequence.new([method(:one),method(:two)])
#seq.call_all(*[1,2],3)
#seq.add(method(:three))
#seq.remove(:two)
#seq.call(:three,3)
#p seq.methods