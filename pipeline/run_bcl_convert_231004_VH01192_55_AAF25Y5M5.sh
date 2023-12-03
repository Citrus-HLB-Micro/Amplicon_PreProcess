#!/usr/bin/bash -l
#SBATCH -p short -c 48 --mem 64gb -C xeon 

module load bclconvert
# see this on google cloud
# gs://stajichlab-ecdre/Amplicon/231004_VH01192_55_AAF25Y5M5.NextSeq2000_raw

bcl-convert --bcl-input-directory 231004_VH01192_55_AAF25Y5M5.NextSeq2000_raw --output-directory 231004_VH01192_55_AAF25Y5M5 \
	--force --sample-sheet ECDRE/231004_VH01192_55_AAF25Y5M5.csv
