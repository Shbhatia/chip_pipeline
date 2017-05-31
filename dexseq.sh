#prepare annotation
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_prepare_annotation.py /home/sb/genome_data/GRCh38/annotation/

#samtools sort by name
samtools sort -n Aligned.out.bam > sorted_n.bam --threads 20

#created bin intervals
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/10a_sic/sorted_n.bam /home/sb/dexseq_untreated1.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/10a_sit/sorted_n.bam /home/sb/dexseq_treated1.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/mc_star_output/sorted_n.bam /home/sb/dexseq_untreated2.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/mt_star_output/sorted_n.bam /home/sb/dexseq_treated2.txt -p yes -f bam
