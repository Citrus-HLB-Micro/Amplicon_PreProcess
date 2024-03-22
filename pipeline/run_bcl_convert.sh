#!/usr/bin/bash -l
#SBATCH -p short -c 64 --mem 128gb -C xeon --out logs/bcl-convert.%A_%a.log
module load bclconvert
ulimit -n 1000000
# see this on google cloud
# gs://stajichlab-ecdre/Amplicon/
CPU=64

N=${SLURM_ARRAY_TASK_ID}

if [ -z $N ]; then
    N=$1
    if [ -z $N ]; then
        echo "Need an array id or cmdline val for the job"
        exit
    fi
fi

SHEET=flowcells.csv
BASE=/bigdata/stajichlab/shared/projects/ECDRE/Amplicon/raw/archive_raw
OUT=/bigdata/stajichlab/shared/projects/ECDRE/Amplicon/data/UF_UCR_ECDRE_Trials/Flowcells
mkdir -p $OUT
IFS=,
sed -n ${N}p $SHEET | while read FLOWCELL DESC NOTE
do
	bcl-convert --bcl-input-directory $BASE/$FLOWCELL --output-directory $OUT/$FLOWCELL \
		--no-lane-splitting true --bcl-num-conversion-threads $CPU \
	  	--force --sample-sheet $(realpath ECDRE/$FLOWCELL.csv) --output-legacy-stats=true 
done
