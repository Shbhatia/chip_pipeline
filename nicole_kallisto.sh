#create index using hg38 transcriptome fasta
kallisto index -i nicole_transcriptome.idx /home/sb/genome_data/GRCh38/sequence/Homo_sapiens.GRCh38.rel79.cdna.all.fa.gz

#quantification algorithm
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R1-LPCX-siC -b 100 -t 20 /home/roberto/nicole/1-LPCX-siC/FCH3LYMBBXX-HKRDHUMhwoEAAARAAPEI-201_L7_1.fq.gz /home/roberto/nicole/1-LPCX-siC/FCH3LYMBBXX-HKRDHUMhwoEAAARAAPEI-201_L7_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R1-LPCX-siK -b 100 -t 20 /home/roberto/nicole/2-LPCX-siK/FCH3LYMBBXX-HKRDHUMhwoEAABRAAPEI-202_L7_1.fq.gz /home/roberto/nicole/2-LPCX-siK/FCH3LYMBBXX-HKRDHUMhwoEAABRAAPEI-202_L7_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R1-TIP60-siC -b 100 -t 20 /home/roberto/nicole/3-TIP60-siC/FCH3LYMBBXX-HKRDHUMhwoEAACRAAPEI-203_L7_1.fq.gz /home/roberto/nicole/3-TIP60-siC/FCH3LYMBBXX-HKRDHUMhwoEAACRAAPEI-203_L7_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R1-TIP60-siK -b 100 -t 20 /home/roberto/nicole/4-TIP60-siK/FCH3LYMBBXX-HKRDHUMhwoEAADRAAPEI-204_L7_1.fq.gz /home/roberto/nicole/4-TIP60-siK/FCH3LYMBBXX-HKRDHUMhwoEAADRAAPEI-204_L7_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R2-LPCX-siC -b 100 -t 20 /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/LPCX-siC/FCHCYTLBBXX_L8_HKRDHUMgqaEAAARAAPEI-227_1.fq.gz /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/LPCX-siC/FCHCYTLBBXX_L8_HKRDHUMgqaEAAARAAPEI-227_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R2-LPCX-siK -b 100 -t 20 /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/LPCX-siK/FCHCYTLBBXX_L8_HKRDHUMgqaEAABRAAPEI-201_1.fq.gz /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/LPCX-siK/FCHCYTLBBXX_L8_HKRDHUMgqaEAABRAAPEI-201_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R2-TIP60-siC -b 100 -t 20 /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/TIP60-siC/FCHCYTLBBXX_L8_HKRDHUMgqaEAACRAAPEI-202_1.fq.gz /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/TIP60-siC/FCHCYTLBBXX_L8_HKRDHUMgqaEAACRAAPEI-202_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/R2-TIP60-siK -b 100 -t 20 /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/TIP60-siK/FCHCYTLBBXX_L8_HKRDHUMgqaEAADRAAPEI-205_1.fq.gz /home/roberto/nicole/R2_cdts-hk.genomics.cn/F16FTSAPHT0948_HUMgqaE/Clean/TIP60-siK/FCHCYTLBBXX_L8_HKRDHUMgqaEAADRAAPEI-205_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/Rx-siC -b 100 -t 20 /home/roberto/nicole/Nicole-HeLa_siC_siK_Feb_2015/siC_FCC6M77ACXX-HUMedoEAAARAAPEI-207_L4_1.fq.gz /home/roberto/nicole/Nicole-HeLa_siC_siK_Feb_2015/siC_FCC6M77ACXX-HUMedoEAAARAAPEI-207_L4_2.fq.gz
kallisto quant -i /home/sb/nicole/nicole_transcriptome.idx -o /home/sb/nicole/Rx-siK -b 100 -t 20 /home/roberto/nicole/Nicole-HeLa_siC_siK_Feb_2015/siK_FCC6M77ACXX-HUMedoEAABRAAPEI-208_L4_1.fq.gz /home/roberto/nicole/Nicole-HeLa_siC_siK_Feb_2015/siK_FCC6M77ACXX-HUMedoEAABRAAPEI-208_L4_2.fq.gz

#sleuth (in R)
base_dir <- “/home/sb/nicole”
sample_id <- dir(file.path(base_dir, "kallisto_output"))
kal_dirs <- sapply(sample_id, function(id) file.path(base_dir, "kallisto_output", id, "kallisto"))
s2c <- read.table(file.path(base_dir, "seq_info.txt"), header = TRUE, stringsAsFactors=FALSE)
s2c <- dplyr::select(s2c, sample = run_accession, condition)
s2c <- dplyr::mutate(s2c, path = kal_dirs)
source("http://bioconductor.org/biocLite.R")
biocLite("biomaRt")
mart <- biomaRt::useMart(biomart = "ENSEMBL_MART_ENSEMBL", dataset = "hsapiens_gene_ensembl", host = 'ensembl.org')
t2g <- biomaRt::getBM(attributes = c("ensembl_transcript_id", "ensembl_gene_id", "external_gene_name"), mart = mart)
t2g <- dplyr::rename(t2g, target_id = ensembl_transcript_id, ens_gene = ensembl_gene_id, ext_gene = external_gene_name)
so <- sleuth_prep(s2c, ~ condition, target_mapping = t2g)
so <- sleuth_fit(so)
so <- sleuth_fit(so, ~1, 'reduced')
so <- sleuth_lrt(so, 'reduced', 'full')
results_table <- sleuth_results(so, 'reduced:full', test_type = 'lrt')
sleuth_live(so)
