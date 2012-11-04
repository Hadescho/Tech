#!/bin/env ruby
# encoding: utf-8
# I'm using encoding in order to be able to read cyrilic

class First
	class Second
		@i = 1337
		def print_I
			puts @i
		end
	end
	@i = 1338
	def print_I
		puts @i
	end
end

newfirst = First.new
newfirst.print_I
