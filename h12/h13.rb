class Stack
  @stack
  @a = 0
  @b = 0
	temp = 0
  def initialize(userInput)
   @stack = userInput.split " "
   for i in 0..@stack.size - 1
		if @stack[i] != "+" and @stack[i] != "-" and @stack[i] != "*" and @stack[i] != "/"
			@stack = @stack[i].to_i
		end
	end
  end
	
  def getstack
    return @stack
  end
  
  def operation
	if @stack[0] == "+"
      puts "v +"
      @stack[0] = @a+@b
      @a = 0
      @b = 0
    end
    if @stack[0] == "-"
      puts "v -"
      @stack[0]=@a-@b
      @a = 0
      @b = 0
    end
    if @stack[0] == "*"
      puts "v *"
      @stack[0] = @a*@b
      @a = 0
      @b = 0
    end
    if @stack[0] == "/"
      puts "v /"
      @stack[0] = @a/@b
      @a = 0
      @b = 0
    end
    if @stack[0] == /^[\d]+(\.[\d]+){0,1}$/ 
     puts " v .match"
     if a == 0
       puts "v a==0" 
       @a = @stack[0].to_i
	   @stack = @stack[0].to_i
     else 
       @b = @stack[0].to_i
       puts "v b==0" 
     end
    end
	puts @stack
   @stack = @stack.delete(@stack[0])
    end
  def parsestack
	# puts self.get@stack
    while @stack.size - 1 > 1
      self.operation
	 
      #puts "tuk ostava bezkraen"
    end 
      
    
  end
end


userStack = Stack.new(gets.chomp)
userStack.parsestack()
puts userStack.getstack
puts userStack.getstack[0] == 12


