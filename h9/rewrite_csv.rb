require "csv"
def rewrite_csv()
	CSV.open("names.csv","r")
	CSV.foreach("names.csv") do |row|
		if row == ",,,,"
			row.delete
		end
	end
end

rewrite_csv()