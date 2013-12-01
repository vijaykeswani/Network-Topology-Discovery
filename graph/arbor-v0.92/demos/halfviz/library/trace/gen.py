from itertools import cycle
with open("route") as f:
	content = f.readlines()
flag =0
array=[]
running = True
licycle = cycle(content)
# Prime the pump
total=len(content)
nextelem = licycle.next()
first = nextelem
count=0
while running:
    	line, nextelem = nextelem, licycle.next()
	#print nextelem[:-1]
	if line[0] != '(' and line[0] != '*':
		if(len(array) > 1):
			print array
			flag=0
		if flag==0:
			del array[:]
			array.append("localhost")
			flag=1
	elif line[0]=='(':
		array.append(line[1:-2])
	elif line[0]=='*' and nextelem[0]!='*':
		array.append(nextelem[:-1])		
	#count+=1
        if count==total:
                break
	count+=1
