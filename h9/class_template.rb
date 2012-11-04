#!/bin/env ruby
# encoding: utf-8
# I'm using encoding in order to be able to read cyrilic
class Homework
		@number
		@name
		@deadline
		@handover
		@links = Array.new
		@met_deadline
		
		def set_Number(number)
			@number = number
		end
		
		def get_Number()
			return @number
		end
		
		def set_Name()
			if get_Number() == 1  
				@name = "Предадени входни нива"
			
			elsif get_Number() == 2 
				@name = "Направени хранилища с качени входни нива"
			
			elsif get_Number() == 3  
				@name = "Събиране на числата в колана на csv файл"
			
			elsif get_Number() == 4 
				@name = "Събиране на числата в колана на csv файл спрямо друга колона"
			
			elsif get_Number()== 5 
				@name = "Добре структорирано хранилище"
			
			elsif get_Number() == 6  
				@name = "Въведение в Java. Обработка на аргументи от командния ред"
			
			elsif get_Number() == 7 
				@name = "Автоматична подредба на пътници в самолет"
			
			elsif get_Number == 8  
				@name = "Най-популярен ученик в клас"
			
			elsif get_Number == 9 
				@name = "Създаване на статия, описваша процеса на commit, pull, etc през терминал"
			end
		end
		
		def get_Name()
			return @name
		end	
		
		def set_Deadline()
			if get_Number() == 1
				@deadline = Time.mktime(2012,9,30,10,50,00)
			elsif get_Number() == 2 or get_Number() == 3
				@deadline = Time.mktime(2012,10,2,10,50,00)
			elsif get_Number() == 4
				@deadline = Time.mktime(2012,10,4,10,50,00)
			elsif get_Number() == 5
				@deadline = Time.mktime(2012,10,9,10,50,00)
			elsif get_Number() == 6
				@deadline = Time.mktime(2012,10,10,20,00,00)
			elsif get_Number() == 7
				@deadline = Time.mktime(2012,10,15,20,00,00)
			elsif get_Number() == 8
				@deadline = Time.mktime(2012,10,17,20,00,00)
			elsif get_Number() == 9
				@deadline = Time.mktime(2012,10,22,20,00,00)
			end
		end
		
		def get_Deadline()
			return @deadline
		end
		
		def set_Handover(year,month,day,hour,minute,second)
			@handover = Time.mktime(year,month,day,hour,minute,second)
		end
		
		def get_Handover()
			return @handover
		end
		
		def set_Links(links)
			@links = links
		end
		
		def get_Links()
			return @links
		end
		
		def set_Met_Deadline()
			temp = @deadline <=> @handover
			if temp == -1 or temp == 0 
				@met_deadline = "Yes"
			else 
				@met_deadline = "No"
			end
		end
		
		def get_Met_Deadline()
			return @met_deadline
		end
end
class Student
	@klas 
	@number
	@name
	@email
	@belt = "white"
	@homeworks = Array.new(9){Homework.new}
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
