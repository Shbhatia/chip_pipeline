#map to genome index using STAR
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/shresh/MCF_s_1.fq.gz /home/sb/james/shrna/shresh/MCF_s_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/shresh/staralign/MSCV/MC/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/shresh/MCF_s60_1.fq.gz /home/sb/james/shrna/shresh/MCF_s60_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/shresh/staralign/MSCV/MT/

python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/new_dexseq/Homo_sapiens.GRCh38.94.DEXSeq.chr.gff -p yes -r name -f bam -s no /home/sb/james/shrna/shresh/staralign/MSCV/MC/MC_sorted_n.bam MC_1fb.txt
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/new_dexseq/Homo_sapiens.GRCh38.94.DEXSeq.chr.gff -p yes -r name -f bam -s no /home/sb/james/shrna/shresh/staralign/MSCV/MT/MT_sorted_n.bam MT_1fb.txt

python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/new_dexseq/Homo_sapiens.GRCh38.94.DEXSeq.chr.gff /home/sb/star_output/mc_star_output/sorted_n.bam MC_2fb.txt -p yes -f bam -s no -r name
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/new_dexseq/Homo_sapiens.GRCh38.94.DEXSeq.chr.gff /home/sb/star_output/mt_star_output/sorted_n.bam MT_2fb.txt -p yes -f bam -s no -r name

#running locally
indir = file.path("/Users/sbhatia/Documents/sjdata/alternative_splicing/alt_splicing_star/dexseq/dexseq")
countFiles = list.files(indir, pattern = "txt$", full.names = "TRUE")
flattenedFile = list.files(indir, pattern="gff$", full.names="TRUE")
sampleTable = read.csv("/Users/sbhatia/Documents/sjdata/alternative_splicing/alt_splicing_star/dexseq/dexseq/h2az_colnames.csv")
suppressPackageStartupMessages( library( "DEXSeq" ) )
#feed data into R package
dxd = DEXSeqDataSetFromHTSeq(countFiles, sampleData=sampleTable, design= ~ sample + exon + condition:exon, flattenedfile=flattenedFile )
#seq depth normalisation
dxd = estimateSizeFactors( dxd )
#estimating variance of biological replicates
dxd = estimateDispersions( dxd )
#differential exon usage
dxd = testForDEU( dxd )
#calculate log fold changes
dxd = estimateExonFoldChanges( dxd, fitExpToVar="condition")
#store results in a variable dxr1
dxr1 = DEXSeqResults( dxd )
