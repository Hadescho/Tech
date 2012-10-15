def zerolator (seat)
	for line in 0..26
		for col in 0..5
			seat [line][col] = 0;
		end
	end
end

def display (seat)
	system("cls")
	puts ""
	for line in 0..26
		for col in 0..5
			if col == 3 
				print " "
			end
			#print "["
			#print line
			#print "]"
			#print "["
			#print col
			#print "]"
			print seat[line][col]
			#print " "
			#sleep(0.01)
		end
		puts ""
	end
	puts ""
	sleep(1.0)
end

def generateGroup()
	return Random.rand(3)+1
end

def fillPlane (seat)
	is_full = false
	
	while !is_full
		group = generateGroup()
		
		if group == 1
			line = 0

			while line<27 
				col = 0
				
				while col<6 
					if seat[line][col] == 0
						seat[line][col] = 1
						#print "setting seat at "
						#print line
						#print "-"
						#print col
						#puts ""
						#sleep(1.0)
						line = 27
						col = 6
					end
					col += 1
				end
				line += 1
			end
		elsif group == 2
			line = 0

			while line<27 
				col = 0
				
				while col<6 
					if seat[line][col] == 0 and seat[line][col+1] == 0 and col != 2 and col != 5
						seat[line][col] = 2
						seat[line][col+1] = 2
						#print "setting seat at "
						#print line
						#print "-"
						#print col
						#puts ""
						#sleep(1.0)
						line = 27
						col = 6
					end
					col += 1
				end
				line += 1
			end
		elsif group == 3
			line = 0

			while line<27 
				col = 0
				
				if seat[line][0] == 0 and seat[line][1] == 0 and seat[line][2] == 0
					seat[line][0] = 3
					seat[line][1] = 3
					seat[line][2] = 3
					line = 27
				elsif seat[line][3] == 0 and seat[line][4] == 0 and seat[line][5] == 0
					seat[line][3] = 3
					seat[line][4] = 3
					seat[line][5] = 3
					line = 27
				end
				
				line += 1
			end
		end
		
		if true
			is_full = true
			for line in 0..26
				for col in 0..5
					if seat[line][col] == 0 
						is_full = false
					end
				end
			end
		end
		puts""
		display(seat)
	end
end

seat = Array.new(27) { Array.new(6) }
zerolator(seat)
display(seat)
fillPlane(seat)