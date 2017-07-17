/home/sb/programfiles/STAR/source/STAR --genomeDir /home/sb/genome_data/GRCh38/star_index_100/ \
--readFilesIn /home/sb/shweta/1/FCHGHHVBBXX-HKRDHUMgaxEAAARAAPEI-222_L1_1.fq.gz /home/sb/shweta/1/FCHGHHVBBXX-HKRDHUMgaxEAAARAAPEI-222_L1_2.fq.gz \
--twopassMode Basic \
--outReadsUnmapped None \
--chimSegmentMin 20 \
--chimJunctionOverhangMin 12 \ --alignSJDBoverhangMin 10 \
--alignMatesGapMax 200000 \
--alignIntronMax 200000 \
--chimSegmentReadGapMax parameter 3 \ --alignSJstitchMismatchNmax 5 -1 5 5 \
--runThreadN 25 \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/sb/shweta/1/star_output/
#edited prep_genome_lib.pl; set CPU to 15 and changed directory of STAR command to /home/sb/STAR/source/STAR
perl ../FusionFilter/edit2_prep_genome_lib.pl --genome_fa ref_genome.fa --gtf ref_annot.gtf --blast_pairs blast_pairs.outfmt6.gz

perl ./STAR-Fusion_new.pl --genome_lib_dir /home/sb/programfiles/STAR-Fusion_v0.7.0_FULL/GRCh38_gencode_v23_CTAT_lib/ \
-J /home/sb/shweta/1/star_output/Chimeric.out.junction \
--CPU 25 \
--output_dir /home/sb/shweta/1/star_output/star_fusion_outdir/

perl STAR-Fusion_new.pl --genome_lib_dir /home/sb/programfiles/STAR-Fusion_v0.7.0_FULL/GRCh38_gencode_v23_CTAT_lib/ \
             --left_fq /home/sb/shweta/1/FCHGHHVBBXX-HKRDHUMgaxEAAARAAPEI-222_L1_1.fq.gz \
             --right_fq /home/sb/shweta/1/FCHGHHVBBXX-HKRDHUMgaxEAAARAAPEI-222_L1_2.fq.gz \
             --output_dir /home/sb/shweta/1/star_output/star_fusion_outdir
             
/home/sb/programfiles/STAR/source/STAR --genomeDir /home/sb/genome_data/GRCh38/star_index_100/ \
--readFilesIn /home/sb/shweta/12_files/9/FCHCCY2BBXX-HKHUMmijEAAERAAPEI-207_1.fq.gz /home/sb/shweta/12_files/9/FCHCCY2BBXX-HKHUMmijEAAERAAPEI-207_2.fq.gz \
--twopassMode Basic \
--outReadsUnmapped None \
--chimSegmentMin 20 \
--chimJunctionOverhangMin 12 \ --alignSJDBoverhangMin 10 \
--alignMatesGapMax 200000 \
--alignIntronMax 200000 \
--chimSegmentReadGapMax parameter 3 \ --alignSJstitchMismatchNmax 5 -1 5 5 \
--runThreadN 25 \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/sb/shweta/12_files/9/star_output/

/home/sb/programfiles/STAR/source/STAR --genomeDir /home/sb/genome_data/GRCh38/star_index_100/ \
--readFilesIn /home/sb/shweta/3/FCHGHHVBBXX-HKRDHUMgaxEAACRAAPEI-225_L1_1.fq.gz /home/sb/shweta/3/FCHGHHVBBXX-HKRDHUMgaxEAACRAAPEI-225_L1_2.fq.gz \
--twopassMode Basic \
--outReadsUnmapped None \
--chimSegmentMin 20 \
--chimJunctionOverhangMin 12 \ --alignSJDBoverhangMin 10 \
--alignMatesGapMax 200000 \
--alignIntronMax 200000 \
--chimSegmentReadGapMax parameter 3 \ --alignSJstitchMismatchNmax 5 -1 5 5 \
--runThreadN 25 \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/sb/shweta/3/star_output/
