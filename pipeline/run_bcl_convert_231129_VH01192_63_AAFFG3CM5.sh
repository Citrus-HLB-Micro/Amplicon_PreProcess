#!/usr/bin/bash -l
#SBATCH -p short -c 48 --mem 64gb -C xeon 

module load bclconvert
# see this on google cloud
# gs://stajichlab-ecdre/Amplicon/231129_VH01192_63_AAFFG3CM5.NextSeq2000_raw

bcl-convert --bcl-input-directory 231129_VH01192_63_AAFFG3CM5.NextSeq2000_raw --output-directory 231129_VH01192_63_AAFFG3CM5 \
	--force --sample-sheet ECDRE/231129_VH01192_63_AAFFG3CM5.csv
