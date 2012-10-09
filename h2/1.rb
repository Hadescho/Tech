#Техологично училище Електронни системи към ТУ София
#11 А
#22
#Николай Тихомиров Коцев
#Събиране на числата в шестата колона на csv файл
require 'csv'
def process_file
	sum = 0
	CSV.foreach("exam.csv") do |row|
	sum = sum + row[4]
	end
	print "Sum = "
	puts sum
	
end

process_file
sleep 3