# Rochelle Knight, Venexia Walker, et al., 2024.

import sys, csv, re

codes = [{"code":"77176002","system":"snomedct"},{"code":"H3101","system":"snomedct"},{"code":"Y6628","system":"snomedct"},{"code":"X20Qm","system":"snomedct"},{"code":"YA602","system":"snomedct"},{"code":"Y0983","system":"snomedct"},{"code":"137R.","system":"snomedct"},{"code":"Y0994","system":"snomedct"},{"code":"Y09a0","system":"snomedct"},{"code":"1371","system":"snomedct"},{"code":"Ub0oq","system":"snomedct"},{"code":"137P.","system":"snomedct"},{"code":"XaXYo","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_01-smoking-status-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_01-smoking-status-nonsmoker---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_01-smoking-status-nonsmoker---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_01-smoking-status-nonsmoker---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
