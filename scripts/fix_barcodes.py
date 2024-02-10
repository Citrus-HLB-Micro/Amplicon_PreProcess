#!/usr/bin/env python3
from Bio.Seq import Seq
import sys
import csv
with open(sys.argv[1],"r") as fh:
    reader = csv.reader(fh,delimiter="\t")
    outcsv = csv.writer(sys.stdout,delimiter=",")
    header= next(reader)
    outcsv.writerow(['Sample_ID','Index'])
    for row in reader:
        if len(row) < 3:
            print(row)
            continue
        samp = row[1]
        barcode = Seq(row[2])
        if samp.endswith("ITS"):
            barcode = barcode.reverse_complement()
        outcsv.writerow([samp,barcode])
