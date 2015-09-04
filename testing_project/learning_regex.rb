def break_row()
	puts "hello \x0Ais this working? \x0Awhy yes it is! \x0A " # \x0A and \n is break row
	puts "hello again \nis this working? \nagain, yes it is"
end

def regex_eq_literal()
	puts "1+1=2"
	puts "="
	puts "1\+1=2"
	puts "1\+1=2" == "1+1=2"
end

def regex_match?(string,regex)
	puts string
	puts regex
	puts string == regex
end

#break_row
#regex_match?("hello","l{2}")

a = Dir.new("test")
p a.path
Dir.chdir("test")
p Dir.getwd
r1 = Regexp.new(a.path, true)
puts (r1 =~ Dir.getwd) != nil