#!/bin/env ruby
# encoding: utf-8
# I'm using encoding in order to be able to read cyrilic

	class Student
	@klas 
	@number
	@name
	@email
	@belt = "white"
	@error = false
	
	def set_Klas(new_klas)
		@klas = new_klas

	end
	def get_Klas()
		return @klas
	end
	
	
	
	def set_Number(num)
		@number = num.to_i

		#if @number == 0
		#	@error = true
		#	puts "Error : nonnumeric string in @number"
		#end

	end
	def get_Number()
		return @number
	end
	
	def set_Name(name)
		@name = name.capitalize
	end
	
	def get_Name()
		return @name
	end
	
	def set_Email(email)
		@email = email.downcase
	end
	
	
	def get_Email()
		return @email
	end
	
	def set_Belt(belt= "white" )
		@belt = belt.downcase
		puts "Belt set"
	end 

	def get_Belt()
		#puts "Belt get"
		return @belt
	end
	def get_Error?()
		return @error
	end
	def print_On_Screen()
		if @error == false
			puts "#{@klas},#{@number},#{@name},#{@email},#{@belt}"
		end
	end
end

	

=begin
--------Debuging class
	students = Student.new
	students.set_Klas("11 а")
	students.set_Number ("22")
	students.set_Name ("Николай Тихомиров Коцев")
	students.set_Email ("Nikolay_Kotzev@abv.bg")
	students.set_Belt ("White")
	students.print_on_screen()
=end
