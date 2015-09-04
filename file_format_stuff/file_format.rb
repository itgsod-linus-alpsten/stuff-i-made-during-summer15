def read_csv(path)
	File.read(path).split(/\n/).inject([]) {|lines,string|lines << string.split(',')}
end

def read_ini(path)
	File.read(path).split(/\n/).inject({}) do |lines,values|
		values.split('=').each do |key,value|
			lines[key] = value
		end
	end
end

p read_csv('csv_test_file.txt')