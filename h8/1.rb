require "csv.rb"


person2 = Array.new(30){ Array.new(30) }
person = Array.new(30){ Array.new(30) }
for i in 0..29
	for ii in 0..29
		person[i][ii] = 0
		person2[i][ii] = 0
	end
end

for i in 1..29

	string = "#{i.to_s}.csv"
	#puts string
	last_person = 0
		
	CSV.foreach (string) do |line|
			num = line[1]
			person[Integer(num)][0] = (person[Integer(num)][0] + 1)
			person[Integer(num)][Integer(last_person)] = (person[Integer(num)][Integer(last_person)] + 1)
			
			person2 [Integer(last_person)][Integer(num)] += 1
			last_person = num
		end
	for i in 1..29
	#puts "#{i} = #{person[i][0]}"
	end
		
end
#for i in 1..29
	#puts "#{i} = #{person[i]}"
#end
max = Array.new [0,0]
min = Array.new [1337,1337]
for i in 0..29
	if max[1] < person[i][0]
		max[0] = i
		max[1] = person[i][0]
	end
	if min[1] > person[i][0] and person[i][0] != 0
		min[0] = i
		min[1] = person[i][0]
	end
end
#giver
last_giveer_gives = 0
least_gives = 1337
#giver
for i in 1..29
	best_giver_gives = -1
	best_giver_number= 0
	for ii in 1..29
		if person[i][ii] > best_giver_gives
			best_giver_number = ii
			best_giver_gives = person[i][ii]
			last_giver_gives = best_giver_gives
			if last_giver_gives < least_gives and last_giver_gives > 0
				least_gives = last_giver_gives
			end
		end
	end
		if last_giver_gives !=0
			puts "Nomer #{i} e poluchil #{last_giver_gives} puti lista ot #{best_giver_number}"
		end
end
#gave_to
last_giveer_gives = 0
least_recieves = 1337

for i in 1..29
	best_giver_gives = -1
	best_giver_number= 0
	for ii in 1..29
		if person2[i][ii] > best_giver_gives
			best_giver_number = ii
			best_giver_gives = person2[i][ii]
			last_giver_gives = best_giver_gives
			if last_giver_gives < least_recieves and last_giver_gives > 0
				least_recieves = last_giver_gives
			end
		end
	end
	
		if last_giver_gives !=0
			puts "Nomer #{i} e predeal #{last_giver_gives} puti lista na #{best_giver_number}"
		end
end

puts "Nai-malko predavaniq na lista mejdu 2-ma= #{least_gives}"
puts "The number with most points is  #{max[0]} with #{max[1]} points"
puts "The number with least points is  #{min[0]} with #{min[1]} points"
