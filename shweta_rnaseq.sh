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

STAR-Fusion --genome_lib_dir /path/to/your/CTAT_resource_lib \ 
-J /home/sb/shweta/1/star_output/Chimeric.out.junction \
--CPU 25
--output_dir /home/sb/shweta/1/star_output/star_fusion_outdir/

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
