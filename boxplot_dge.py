import numpy as np
import pandas as pd
from scipy import stats, integrate
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(color_codes=True)
import math
from math import log
plt.figure(figsize=(5.51,7.48))
#file with counts (from htseq-counts)
infile = open('final_counts_hep3b.tsv')
#file with significantly up/down-regulated genes (p<0.05)
infile1 = open('hep3b_sicvssik_down_foldchange.txt')
#(out)-file with log2(counts)
outfile = open('final_counts_down_hep3b.csv', 'w')


lines = infile.readlines()[1:]
gene = []
untreated = []
treated = []

for line in lines:
    elements = line.strip().split("\t")
#all genes
    gene.append(elements[0])
#counts for untreated sample
    untreated.append(int(elements[1]))
#counts for treated sample
    treated.append(int(elements[2]))
print len(gene), len(untreated), len(treated)

#significantly up/down-regulated gene list
gene2 = []
lines2 = infile1.readlines()
for line2 in lines2:
    elements2 = line2.strip().split("\t")
    gene2.append(elements2[0])
#remove annoying space after each list element
k = []
for i in gene2:
    j = i.replace(' ', '')
    k.append(j)
    
#make a sub-list of all gene list that contains only significantly up/downregulated genes
newlist = []

for y in gene:
    for x in k:
        if x == y:
            newlist.append(x)
print len(newlist)
g = len(gene)
sic = []
sik = []
idx = []
#get index number of each gene in main gene list that is significantly up/down-regulated
for t in gene:
    for o in newlist:
        if t==o:
            idx.append(gene.index(t))
print idx
#get counts of only those genes that are up/down-regulated and get log2 value in new list for untreated and treated samples
for m in idx:
    if untreated[m] != 0 and treated[m] != 0:
        sic.append(math.log(untreated[m],2))
        sik.append(math.log(treated[m],2))
#append x-axis labels at top of each log2(counts) list
sic.insert(0, 'siC')
sik.insert(0, 'siK')
b = len(sic)
l = len(sik)
print b, l
#create csv file with each log2(counts) list
for h in range(0,b):
    outfile.write(str(sic[h]) + "," + str(sik[h]) + "\n")
outfile.close()


tips2 = pd.read_csv('final_counts_down_hep3b.csv')

#get boxplot
ax = sns.boxplot(data=tips2)
#x- and y-axis labels
ax.set(xlabel='Treatment', ylabel='Counts (log2)')
plt.show()
