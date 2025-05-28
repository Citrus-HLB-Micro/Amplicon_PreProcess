#!/usr/bin/bash -l

for pool in $(seq 7 7)
do
	for type in ITS 16S
	do
		FILE=Pool_$pool.$type.tsv
		CSV=Pool_$pool.$type.csv
		python ../scripts/fix_barcodes.py $FILE > $CSV
		dos2unix $CSV
		perl -i -p -e "s/^(Pos|Neg|NAA)[-_]/\$1-Pool$pool-/" $CSV
	done
done

