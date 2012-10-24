#Технологично училище Електронни системи http://elsys-bg.org
#
require "csv"

input_file = ARGV[0]
puts input_file

output_file = "output"+input_file
CSV.open(output_file,"w") do |csv|
	CSV.foreach(input_file) do |row|
		csv << [(row[0].to_i)/2, Integer(row[1].to_i)/2]
		
	end
end
