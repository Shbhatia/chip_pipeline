
python programfiles/RepEnrich/RepEnrich_setup.py repenrich/hg38_repeatmasker_clean.txt genome_data/GRCh38/sequence/hg38.fa repenrich/setup_folder_hg38

bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asic_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq -2 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq /home/sb/10A-rnaseq/10asic_unique.sam
bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asit_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_1.fq -2 /home/sb/10A-rnaseq/10a_sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_2.fq /home/sb/10A-rnaseq/10asit_unique.sam

#Mapping stats:

#sb@sjlab2:~$ bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asic_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq -2 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq /home/sb/10A-rnaseq/10asic_unique.sam
#Time loading reference: 00:00:04
#Time loading forward index: 00:00:07
#Time loading mirror index: 00:00:07
#Seeded quality full-index search: 01:28:03
# reads processed: 24136074
# reads with at least one reported alignment: 10175194 (42.16%)
# reads that failed to align: 12355076 (51.19%)
# reads with alignments suppressed due to -m: 1605804 (6.65%)
#Reported 10175194 paired-end alignments to 1 output stream(s)
#Time searching: 01:28:21
#Overall time: 01:28:21


