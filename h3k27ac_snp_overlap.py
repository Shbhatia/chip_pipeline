infile1 = open('/home/sb/genome_seq_mcf7/coord_up_3vs1_lgfc1.bed')
infile2 = open('/home/sb/genome_seq_mcf7/nohash_snps.vcf')
outfile = open('/home/sb/genome_seq_mcf7/snp_overlap.bed', 'w')

lines1 = infile1.readlines()
lines2 = infile2.readlines()

chrom = []
start = []
end = []

for line1 in lines1:
    elements1 = line1.strip().split(" ")
    chrom.append(elements1[0])
    start.append(int(elements1[3]))
    end.append(int(elements1[6]))

chrom1 = []
start1 = []

for line2 in lines2:
    elements2 = line2.strip().split("\t")
    chrom1.append(elements2[0])
    start1.append(int(elements2[1]))

for m in chrom:
    for n in chrom1:
        if m == n:
            for i in range(0, len(start)):
                for z in range(0, len(start1)):
                    if start1[z] in range(start[i], end[i]):
                        outfile.write(chrom1[z] + "\t" + str(start1[z]) + "\n")
