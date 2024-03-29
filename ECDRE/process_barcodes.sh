#!/usr/bin/bash -l

for pool in $(seq 3)
do
	for type in ITS 16S
	do
		FILE=Pool_$pool.$type.tsv
		CSV=Pool_$pool.$type.csv
		python ../scripts/fix_barcodes.py $FILE > $CSV
		perl -i -p -e "s/^(Pos|Neg|NAA)/\$1-Pool$pool/" $CSV
	done
done

