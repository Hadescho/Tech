import csv
zadachi = 0
line = 0
info = 0
csv = open("exam.csv")
for line in csv :
    info = line.split(",")[4]
    if data.isnumeric():
        zadachi = zadachi + data

print ("Sum ==")
print zadachi    
raw_input ("Press any key to continue")
