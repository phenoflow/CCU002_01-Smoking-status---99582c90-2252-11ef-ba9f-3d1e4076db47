# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"266922007","system":"snomedct"},{"code":"266923002","system":"snomedct"},{"code":"266924008","system":"snomedct"},{"code":"266925009","system":"snomedct"},{"code":"230064005","system":"snomedct"},{"code":"230062009","system":"snomedct"},{"code":"160605003","system":"snomedct"},{"code":"160604004","system":"snomedct"},{"code":"230056004","system":"snomedct"},{"code":"230063004","system":"snomedct"},{"code":"160603005","system":"snomedct"},{"code":"230060001","system":"snomedct"},{"code":"401201003","system":"snomedct"},{"code":"65568007","system":"snomedct"},{"code":"160606002","system":"snomedct"},{"code":"1373","system":"snomedct"},{"code":"XE0om","system":"snomedct"},{"code":"1374","system":"snomedct"},{"code":"XE0ol","system":"snomedct"},{"code":"Ub1tT","system":"snomedct"},{"code":"1376","system":"snomedct"},{"code":"Ub1tV","system":"snomedct"},{"code":"Ub1tS","system":"snomedct"},{"code":"XE0ok","system":"snomedct"},{"code":"1375","system":"snomedct"},{"code":"XE0on","system":"snomedct"},{"code":"XE0oq","system":"snomedct"},{"code":"Ub1tU","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-smoking-status-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-smoking-status-cigar---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-smoking-status-cigar---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-smoking-status-cigar---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
