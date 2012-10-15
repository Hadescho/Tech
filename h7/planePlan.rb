def display() 
	for line in 0..26
		for col in 0..5
			if (col == 3)
				print" "
			end
			print seat[line][col]
		end
	end
	gets
	puts
end

def generateGroup()
	return random.rand(2)+1
end

def placePeople()
	int ppl = generateGroup()
	if ppl == 1
	int breaker = 0
		for line in 0..26
			for col in 0..5
				if seat[line][col]==0
					seat[line][col]=1
					breaker =1
					break
				end
			end
			if breaker ==1
				break
			end
		end
	end

	if ppl == 2
		int breaker = 0
		for line in 0..26
			for col in 0..5
				if seat[line][col]==0 and seat[line][col+1]==0 then 
					seat[line][col] = seat[line][col+1]=1
					breaker = 1
					break
				end
			end
		if breaker == 1 then break
		end
	end
	if ppl == 3
		for line in 0..26
			for col in 0..5
				if seat[line][0] == 0 and seat[line][1] == 0 and seat[line][2] == 0  then
					seat[line][0] = 1
					seat[line][1] = 1
					seat[line][2] = 1
					break
				
				
				elsif seat[line][3] ==0 and seat[line][4] == 0 and seat[line][5] == 0
					seat[line][3] = 1 
					seat[line][4] = 1
					seat[line][5] = 1
					break
				end
			end
		end
	end
	print "Group of: "
	puts ppl
	display(seat)
end

def isFull ()
	int i=1
	for line in 0..26
		for col in 0..5
			if seat[line][col] == 0
				i = 0
			end
		end
	end
	return i
end

def fillPlane() 
	while !isFull(seat)
		placePeople(seat)
	end
end
puts "Tva izobshto she napravi li neshto1"
@@seat =Array.new(27) {Array.new(6)}

fillPlane()
for line in 0..26
		for col in 0..5
			if (col == 3)
				print" "
			end
			print seat[line][col]
		end
	end
	puts "Tva izobshto she napravi li neshto"
