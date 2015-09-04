def filter(array, value)
	array.inject([]) {|list, item| list << item if item == value; list}
end

def exclude(array, value)
	array.select {|item| item != value}
end

def unique(array)
	array.inject([]) {|list,item| list<<item unless list.include?(item); list}
end

x = ["a","b","c","a"]
p unique(x)
p x