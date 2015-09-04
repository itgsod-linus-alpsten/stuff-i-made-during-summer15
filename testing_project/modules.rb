module Mymodule
	def test1
		puts "module"
	end
end

class Myclass
	include Mymodule

	def test1
		puts "class"
	end
end

test = Myclass.new()

test.test1