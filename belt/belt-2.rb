#Да се събере времето за тестове с време > 5
require "csv"
sum = 0
CSV.open("output.csv","w") do |writer|
	CSV.foreach("feature_scenarios_times.csv") do |row|
		temp = row[0]
		
		temp = temp.to_f
		
		if temp > 5.0
			sum = sum + temp
		end
	end
	puts sum
	writer << [sum]
end
puts sum
