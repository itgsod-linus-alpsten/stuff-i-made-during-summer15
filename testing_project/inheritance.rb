class Parent
	def test1
		puts "parent"
	end
end

class Child < Parent
	def test1
		puts "child"
	end
end

Child.new.test1