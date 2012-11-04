#!/bin/env ruby
# encoding: utf-8
# I'm using encoding in order to be able to read cyrilic

require "csv"
require "./class_template.rb"

=begin
def get_da()
	da = " "
	CSV.foreach ("da.csv") do |getda|
		da = getda[0]
	end
	return da
end
=end

def time_split (string,year,month,day,hour,minute,second)
	string = string.split (" ")
	string[0] = string[0].split("/")
	string[1] = string[1].split(":")
	mount = string[0][0]
	day = string[0][1]
	year = string[0][2]
	hour = string[1][0]
	minute = string[1][1]
	second = string[1][2]
end
def parse_belt (belt_input,students)
	puts "1"
	i=0
	first_line = true
	CSV.foreach(belt_input) do |row|
		#puts "2"
		#if first_line == true 
		#	first_line = false
		#	puts "3"
		#else
			if row[9] == "Да"
				puts "4"
				for count in 0..student.size - 1
					puts "5"
					if row[3] == students[count].get_Name
						students[count].set_Belt("Yellow")
						puts "Yellow"
					else
						students[count].set_Belt("White")
						puts "White"
					end
				end
			end
		#end
	end
end

def rewrite_csv(csv_input,csv_output)
	CSV.open(csv_output,"w") do |csv|
		CSV.foreach(csv_input) do |row|
			if row[0] != nil
				csv << row
			end
		end
	end
end

def parse_array(students)
	for i in 0..students.size - 1
		for j in 0..students.size - 1 
			if students[i].get_Email == students[j].get_Email
				if students[i].get_Number == "0" and students[j].get_Number != 0
					students.delete_at(i)
				elsif students[j].get_Number == "0" and students[i].get_Number != 0
					students.delete_at(j)
				end
			end
		end
	end
end
students = Array.new
students[0] = Student.new
def parse_Names_Csv(csv_name,csv_input,csv_output,students)

	


	for file_counter in 1..9
		#file_counter = 9# IGRAI SI TUK
			#csv_name = "./"+csv_name-------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!------------------
			first_line = true
			file_name = file_counter.to_s + ".csv"
			CSV.open(csv_name,"w") do |write|
				CSV.foreach(file_name) do |row|

				  if first_line == true
					first_line = false
				  else
					#students[students.size] = Student.new
					#puts "email-check"
					email_used = false
					
					for i in 0..students.size
						
						if i == 0 
							students[students.size] = Student.new
						end
						begin
							if students[i].get_Email() == row[4]	
							
								
								email_used = true
							end
						rescue
							students[students.size] = Student.new
							if students[i].get_Email() == row[4]	
							
								
								email_used = true
							end
						end
					end
					if email_used == false
						year = 0
						month = 0
						day = 0
						hour = 0
						minute = 0
						second = 0
						students[students.size] = Student.new
						students[students.size-1].set_Klas(row[1])
						students[students.size-1].set_Number(row[2])
						students[students.size-1].set_Name(row[3])
						students[students.size-1].set_Email(row[4])
						students[students.size-1].print_On_Screen
						time_split(row[0],year,month,day,hour,minute,second)
						students[students.size-1].homeworks[file_counter].set_Number(file_counter)
						students[students.size-1].homeworks[file_counter].set_Handover(year,month,day,hour,minute,second) # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!______________!!!!!!!!!!!!!!!!!!
						
					end
				
				
				  end
				end
				parse_array(students)
				parse_belt("belts.csv",students)
				for counter in 0..students.size-1
					if students[counter].get_Name != ""
						write << [students[counter].get_Klas,students[counter].get_Number,students[counter].get_Name,students[counter].get_Email,students[counter].get_Belt]
						#puts students.size	
						students[counter].print_On_Screen()
					end
				end
				
			end
			rewrite_csv(csv_input,csv_output)
	end
end


parse_Names_Csv("names.csv","names.csv","names_true.csv",students)
