require "csv"

x = ARGV[0]
a = Array.new
b = Array.new
y = Array.new

for i in 0..49
	a[i] = 0
	b[i] = 0 
	y[i] = 0
end

CSV.open("output.csv","w") do |writer|
	i=0
	CSV.foreach("belt.csv") do |row|
		a[i] = row[0].to_i
		puts a[i]
		b[i] = row[1].to_i
		y[i] = (a[i].to_i * b[i].to_i) / x.to_i
		puts "#{a[i]}  #{b[i]}  #{y[i]}"
		writer << [a[i],b[i],y[i]]
		i+=1
	end
end
	