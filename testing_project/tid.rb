def min_to_h_and_min(minutes)
	m = minutes%60
	"#{minutes/60}:" << (m < 10 ? ('0'+m.to_s) : m.to_s)
end

puts min_to_h_and_min(131)