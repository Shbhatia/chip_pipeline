
python programfiles/RepEnrich/RepEnrich_setup.py repenrich/hg38_repeatmasker_clean.txt genome_data/GRCh38/sequence/hg38.fa repenrich/setup_folder_hg38

bowtie /home/sb/repenrich/GRCh38/ -p 30 -t -m 1 -S --max /home/sb/10A-rnaseq/10asic_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq -2 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq /home/sb/10A-rnaseq/10asic_unique.sam
