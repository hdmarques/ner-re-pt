import sys

if len(sys.argv) > 3:
	level = sys.argv[1]
	fold = sys.argv[2]
	repeat = sys.argv[3]
else:
	print "Usage: " + sys.argv[0] + " <level> <fold> <repeat>\n"
	sys.exit()

#one = open('repeat-'+repeat+'/ner-results/fold-'+fold+'/out-'+level+'.txt','r').read().splitlines()
#two = open('repeat-'+repeat+'/ner-results/fold-'+fold+'/out-'+level+'-gold.txt','r').read().splitlines()

one = open('out_gold.txt','r').read().splitlines()
two = open('out_entities.txt','r').read().splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		print "Fold: " + fold + " | Level: " + level
		break
	i += 1
