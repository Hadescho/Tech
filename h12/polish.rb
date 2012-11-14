class PolishStack
	@stack = Array.new
	def initialize(userInput)
		@stack = userInput.split
	end
	
	def getStack
		return @stack
	end
	
	def pop
		temp = @stack[0]
		@stack.delete_at(0)
		if temp != "+" and temp !="-" and temp != "*" and temp !="/"
			temp = temp.to_i
		end
		return temp
	end
	
	def getStackSize
		return @stack.size 
	end
	
	def printStack
		print "["
		for i in 0..@stack.size - 1
			print @stack[i]
			print ","
		end
		puts "]"
	end
	
	
end

class PolishArrays
	attr_accessor :operators
	attr_accessor :numbers
	@operators = Array.new(1,nil)
	@numbers = Array.new(1,nil)
	
	def push(pElement) 
		if pElement == "+" or pElement == "-" or pElement == "*" or pElement == "/"
			@operators[@operators.size]=pElement
			if @operators[0] == nil
				@operators.delete(nil)
			end
		else @numbers[@numbers.size]=pElement
			if @operators[0] == nil
				@operators.delete(nil)
			end
		end
	end
	
	def pop(arr)
	#TODO : do a pop method
	end
	
	def print 
	print "Operators : "
	print "["
		for i in 0..@operators.size - 1
			print @operators[i]
			print ","
		end
		puts "]"
	print "Numbers : "	
	print "["
		for i in 0..@numbers.size - 1
			print @numbers[i]
			print ","
		end
		puts "]"
	end
	
	def calculate
	
	end
end

userStack = PolishStack.new(gets.chomp)
userArrays = PolishArrays.new()
for i in 0..userStack.getStackSize - 1
	userArrays.push(userStack.pop)
end
userArrays.print
