#star run
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/mscv/sic/MC_1.fastq   /home/sb/mcf10a_rnaseq/mscv/sic/MC_2.fastq     --outFileNamePrefix /home/sb/star_output/mc_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/mscv/sit/MT_1.fastq   /home/sb/mcf10a_rnaseq/mscv/sit/MT_2.fastq     --outFileNamePrefix /home/sb/star_output/mt_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/str_wt/sic/WCR_1.fastq   /home/sb/mcf10a_rnaseq/str_wt/sic/WCR_2.fastq     --outFileNamePrefix /home/sb/star_output/wcr_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/str_wt/sit/WTR_1.fastq   /home/sb/mcf10a_rnaseq/str_wt/sit/WTR_2.fastq     --outFileNamePrefix /home/sb/star_output/wtr_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/str_kd/sic/KC_1.fastq   /home/sb/mcf10a_rnaseq/str_kd/sic/KC_2.fastq     --outFileNamePrefix /home/sb/star_output/kc_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/str_kd/sit/KT_1.fastq   /home/sb/mcf10a_rnaseq/str_kd/sit/KT_2.fastq     --outFileNamePrefix /home/sb/star_output/kt_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 16   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/e292k/sic/EC_1.fastq   /home/sb/mcf10a_rnaseq/e292k/sic/EC_2.fastq     --outFileNamePrefix /home/sb/star_output/ec_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 16   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/e292k/sit/ET_1.fastq   /home/sb/mcf10a_rnaseq/e292k/sit/ET_2.fastq     --outFileNamePrefix /home/sb/star_output/et_star_ucsc/


/home/sb/programfiles/STAR/source/STAR   --runThreadN 16   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/wt/sic/WC_1.fastq   /home/sb/mcf10a_rnaseq/wt/sic/WC_2.fastq     --outFileNamePrefix /home/sb/star_output/wc_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 16   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/wt/sit/WT_1.fastq   /home/sb/mcf10a_rnaseq/wt/sit/WT_2.fastq     --outFileNamePrefix /home/sb/star_output/wt_star_ucsc/

/home/sb/programfiles/STAR/source/STAR   --runThreadN 16   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/n463t/sic/NC_1.fastq   /home/sb/mcf10a_rnaseq/n463t/sic/NC_2.fastq     --outFileNamePrefix /home/sb/star_output/nc_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 16   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc  --readFilesIn /home/sb/mcf10a_rnaseq/n463t/sit/NT_1.fastq   /home/sb/mcf10a_rnaseq/n463t/sit/NT_2.fastq     --outFileNamePrefix /home/sb/star_output/nt_star_ucsc/

#samtools
samtools view -bS Aligned.out.sam > Aligned.out.bam 
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#get constitutive exons for hg38 gff 
python /home/sb/programfiles/MISO/misopy/exon_utils.py --get-const-exons /home/sb/genome_data/GRCh38/annotation/ucsc/ensGene1.gff --min-exon-size 1000 --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/

#calculate insert size distribution (mean and st dv) for each bam file
python /home/sb/programfiles/MISO/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/mc_star_ucsc/sorted.bam /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/

python /home/sb/programfiles/misopy-0.5.3/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/mt_star_ucsc/sorted.bam /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/mt

python /home/sb/programfiles/misopy-0.5.3/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/kt_star_ucsc/sorted.bam  /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/kckt

python /home/sb/programfiles/misopy-0.5.3/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/ec_star_ucsc/sorted.bam,/home/sb/star_output/et_star_ucsc/sorted.bam  /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/ecet

python /home/sb/programfiles/misopy-0.5.3/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/wc_star_ucsc/sorted.bam,/home/sb/star_output/wt_star_ucsc/sorted.bam  /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/wcwt

python /home/sb/programfiles/misopy-0.5.3/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/nc_star_ucsc/sorted.bam,/home/sb/star_output/nt_star_ucsc/sorted.bam  /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/ncnt

python /home/sb/programfiles/misopy-0.5.3/misopy/pe_utils.py --compute-insert-len /home/sb/star_output/wcr_star_ucsc/sorted.bam,/home/sb/star_output/wtr_star_ucsc/sorted.bam  /home/sb/genome_data/GRCh38/annotation/ucsc/const_exons/ensGene1.min_1000.const_exons.gff --output-dir /home/sb/genome_data/GRCh38/annotation/ucsc/pe_tools/wcrwtr

#MISO run
#SE events
miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/mc_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/mc_out_pe/ —-read-len 101 —-paired-end 174.5 52.5

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/mt_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/mt_out_pe/ —-read-len 101 —-paired-end 174.5 52.5

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/kc_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/kc_out_pe/ —-read-len 101 —-paired-end 180.4 55.2

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/kt_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/kt_out_pe/ —-read-len 101 —-paired-end 180.4 55.2

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/ec_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/ec_out_pe/ —-read-len 101 —-paired-end 177.1 53.6

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/et_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/et_out_pe/ —-read-len 101 —-paired-end 177.1 53.6

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/wc_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/wc_out_pe/ —-read-len 101 —-paired-end 173.4 50.4

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/wt_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/wt_out_pe/ —-read-len 101 —-paired-end 173.4 50.4

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/wcr_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/wcr_out_pe/ —-read-len 101 —-paired-end 177.2 52.9

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/wtr_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/wtr_out_pe/ —-read-len 101 —-paired-end 177.2 52.9

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/nc_star_ucsc/sorted.bam --output-dir /home/sb/miso/nc_out_pe/ —-read-len 101 —-paired-end 181.1 55.0

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_SE_events/ /home/sb/star_output/nt_star_ucsc/sorted.bam --output-dir /home/sb/miso/SE_pe/nt_out_pe/ —-read-len 101 —-paired-end 181.1 55.0

#MXE events
miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/mc_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/mc_out_pe/ —-read-len 101 —-paired-end 174.5 52.5

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/mt_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/mt_out_pe/ —-read-len 101 —-paired-end 174.5 52.5

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/kc_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/kc_out_pe/ —-read-len 101 —-paired-end 180.4 55.2

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/kt_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/kt_out_pe/ —-read-len 101 —-paired-end 180.4 55.2

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/ec_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/ec_out_pe/ —-read-len 101 —-paired-end 177.1 53.6

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/et_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/et_out_pe/ —-read-len 101 —-paired-end 177.1 53.6

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/wc_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/wc_out_pe/ —-read-len 101 —-paired-end 173.4 50.4

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/wt_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/wt_out_pe/ —-read-len 101 —-paired-end 173.4 50.4

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/wcr_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/wcr_out_pe/ —-read-len 101 —-paired-end 177.2 52.9

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/wtr_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/wtr_out_pe/ —-read-len 101 —-paired-end 177.2 52.9

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/nc_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/nc_out_pe/ —-read-len 101 —-paired-end 181.1 55.0

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_MXE_events/ /home/sb/star_output/nt_star_ucsc/sorted.bam --output-dir /home/sb/miso/MXE_pe/nt_out_pe/ —-read-len 101 —-paired-end 181.1 55.0

#A3SS events

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/mc_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/mc_out_pe/ —-read-len 101 —-paired-end 174.5 52.5

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/mt_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/mt_out_pe/ —-read-len 101 —-paired-end 174.5 52.5

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/kc_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/kc_out_pe/ —-read-len 101 —-paired-end 180.4 55.2

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/kt_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/kt_out_pe/ —-read-len 101 —-paired-end 180.4 55.2

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/ec_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/ec_out_pe/ —-read-len 101 —-paired-end 177.1 53.6

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/et_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/et_out_pe/ —-read-len 101 —-paired-end 177.1 53.6

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/wc_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/wc_out_pe/ —-read-len 101 —-paired-end 173.4 50.4

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/wt_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/wt_out_pe/ —-read-len 101 —-paired-end 173.4 50.4

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/wcr_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/wcr_out_pe/ —-read-len 101 —-paired-end 177.2 52.9

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/wtr_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/wtr_out_pe/ —-read-len 101 —-paired-end 177.2 52.9

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/nc_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/nc_out_pe/ —-read-len 101 —-paired-end 181.1 55.0

miso —-run /home/sb/genome_data/GRCh38/annotation/gff/commonshortest/indexed_A3SS_events/ /home/sb/star_output/nt_star_ucsc/sorted.bam --output-dir /home/sb/miso/A3SS_pe/nt_out_pe/ —-read-len 101 —-paired-end 181.1 55.0

#Summarize MISO output
summarize_miso --summarize-samples /home/sb/miso/SE_pe/mc_out_pe /home/sb/miso/SE_pe/mc_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/mt_out_pe /home/sb/miso/SE_pe/mt_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/wc_out_pe /home/sb/miso/SE_pe/wc_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/wt_out_pe /home/sb/miso/SE_pe/wt_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/wcr_out_pe /home/sb/miso/SE_pe/wcr_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/wtr_out_pe /home/sb/miso/SE_pe/wtr_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/kc_out_pe /home/sb/miso/SE_pe/kc_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/kt_out_pe /home/sb/miso/SE_pe/kt_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/ec_out_pe /home/sb/miso/SE_pe/ec_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/et_out_pe /home/sb/miso/SE_pe/et_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/nc_out_pe /home/sb/miso/SE_pe/nc_out_pe_sum
summarize_miso --summarize-samples /home/sb/miso/SE_pe/nt_out_pe /home/sb/miso/SE_pe/nt_out_pe_sum

#compare to get differential isoforms
compare_miso --compare-samples /home/sb/miso/SE_pe/mc_out_pe /home/sb/miso/SE_pe/mt_out_pe /home/sb/miso/SE_pe/mcmt_comparisons/
compare_miso --compare-samples /home/sb/miso/SE_pe/wc_out_pe /home/sb/miso/SE_pe/wt_out_pe /home/sb/miso/SE_pe/wcwt_comparisons/
compare_miso --compare-samples /home/sb/miso/SE_pe/nc_out_pe /home/sb/miso/SE_pe/nt_out_pe /home/sb/miso/SE_pe/ncnt_comparisons/
compare_miso --compare-samples /home/sb/miso/SE_pe/kc_out_pe /home/sb/miso/SE_pe/kt_out_pe /home/sb/miso/SE_pe/kckt_comparisons/
compare_miso --compare-samples /home/sb/miso/SE_pe/ec_out_pe /home/sb/miso/SE_pe/et_out_pe /home/sb/miso/SE_pe/ecet_comparisons/
compare_miso --compare-samples /home/sb/miso/SE_pe/wcr_out_pe /home/sb/miso/SE_pe/wtr_out_pe /home/sb/miso/SE_pe/wcrwtr_comparisons/

compare_miso --compare-samples /home/sb/miso/MXE_pe/mc_out_pe /home/sb/miso/MXE_pe/mt_out_pe /home/sb/miso/MXE_pe/mcmt_comparisons/
compare_miso --compare-samples /home/sb/miso/MXE_pe/wc_out_pe /home/sb/miso/MXE_pe/wt_out_pe /home/sb/miso/MXE_pe/wcwt_comparisons/
compare_miso --compare-samples /home/sb/miso/MXE_pe/nc_out_pe /home/sb/miso/MXE_pe/nt_out_pe /home/sb/miso/MXE_pe/ncnt_comparisons/
compare_miso --compare-samples /home/sb/miso/MXE_pe/kc_out_pe /home/sb/miso/MXE_pe/kt_out_pe /home/sb/miso/MXE_pe/kckt_comparisons/
compare_miso --compare-samples /home/sb/miso/MXE_pe/ec_out_pe /home/sb/miso/MXE_pe/et_out_pe /home/sb/miso/MXE_pe/ecet_comparisons/
compare_miso --compare-samples /home/sb/miso/MXE_pe/wcr_out_pe /home/sb/miso/MXE_pe/wtr_out_pe /home/sb/miso/MXE_pe/wcrwtr_comparisons/
#filter differential SE events
filter_events --filter mc_out_pe_vs_mt_out_pe.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir mcmt_filtered/
filter_events --filter wc_out_pe_vs_wt_out_pe.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir wcwt_filtered/
filter_events --filter nc_out_pe_vs_nt_out_pe.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir ncnt_filtered/
filter_events --filter kc_out_pe_vs_kt_out_pe.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir kckt_filtered/
filter_events --filter ec_out_pe_vs_et_out_pe.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir ecet_filtered/
filter_events --filter wcr_out_pe_vs_wtr_out_pe.miso_bf --num-inc 1 --num-exc 1 --num-sum-inc-exc 10 --delta-psi 0.20 --bayes-factor 10 --output-dir wcrwtr_filtered/
