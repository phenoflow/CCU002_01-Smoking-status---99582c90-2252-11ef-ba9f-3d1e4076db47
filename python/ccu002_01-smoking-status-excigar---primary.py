# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"281018007","system":"snomedct"},{"code":"160621008","system":"snomedct"},{"code":"266928006","system":"snomedct"},{"code":"59978006","system":"snomedct"},{"code":"230057008","system":"snomedct"},{"code":"Y9843","system":"snomedct"},{"code":"1372","system":"snomedct"},{"code":"Y6626","system":"snomedct"},{"code":"Xa1bv","system":"snomedct"},{"code":"Y7677","system":"snomedct"},{"code":"Y7110","system":"snomedct"},{"code":"137O.","system":"snomedct"},{"code":"Y7467","system":"snomedct"},{"code":"137J.","system":"snomedct"},{"code":"XE0op","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-smoking-status-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-smoking-status-excigar---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-smoking-status-excigar---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-smoking-status-excigar---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
