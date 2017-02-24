#run STAR
STAR --genomeDir hg38_index \
--readFilesIn ${left_fq_filename} ${right_fq_filename} \ --twopassMode Basic \
--outReadsUnmapped None \
--chimSegmentMin 20 \
--chimJunctionOverhangMin 12 \ --alignSJDBoverhangMin 10 \
--alignMatesGapMax 200000 \
--alignIntronMax 200000 \
--chimSegmentReadGapMax parameter 3 \ --alignSJstitchMismatchNmax 5 -1 5 5 \
--runThreadN 16 \
--outSAMtype BAM SortedByCoordinate

#run STAR-Fusion
STAR-Fusion --genome_lib_dir /path/to/your/CTAT_resource_lib \ -J Chimeric.out.junction \
--CPU 15
--output_dir star_fusion_outdir
