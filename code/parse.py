"""Put annotations files in the same directory of this script."""

import csv
import re

table1 = []
gene1 = dict()
with open('lfts.gff') as f:
    for line in f:
        if line[0] == '#':
            continue
        attributes = dict()
        for attribute in line.split('\t')[8].strip().split(';'):
            key, value = attribute.split('=')
            attributes[key] = value
        gene1[attributes.get('ID')] = attributes.get('gene', '')
        if attributes.get('gene') is None:
            continue
        if re.match('atp', attributes.get('gene')):
            table1.append(['ATP synthase', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('mdh|fum|suc|for|rbc', attributes.get('gene')):
            table1.append(['Carbon fixation', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('mcp|che|mot', attributes.get('gene')):
            table1.append(['Chemotaxis', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('ars|cop|cut|cus|czc|mer', attributes.get('gene')):
            table1.append(['Metal resistance', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('fle|flr|flg|fli|flh', attributes.get('gene')):
            table1.append(['Motility', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('ndh|nuo', attributes.get('gene')):
            table1.append(['NADH dehydrogenase', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('ntr|nif', attributes.get('gene')):
            table1.append(['Nitrogen fixation', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('ahpC|ccmG|dsbE|bcp|efeB|perR|gpmM|icd|degP|trx|fumC|ybbN|cobS', attributes.get('gene')):
            table1.append(['Oxidative stress response', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])
        elif re.match('bcs|pel|lpx|rfa|lpt|ost|rfb|pga', attributes.get('gene')):
            table1.append(['Polysaccharide', attributes.get('ID'), attributes.get('gene'), attributes.get('product')])

table1.sort(key=lambda x: (x[0], x[2]))
with open('table1.csv', mode='w') as f:
    f.write('Category,ID,Gene,Function\n')
    for line in table1:
        f.write(','.join(line))
        f.write('\n')

table2 = []
gene2 = dict()
with open('lfts.faa.emapper.annotations') as f:
    for line in f:
        attributes = line.strip().split('\t')
        gene2[attributes[0]] = attributes[4]
        if re.match('(?i)atp', attributes[4]):
            table2.append(['ATP synthase', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)mdh|fum|suc|for|rbc', attributes[4]):
            table2.append(['Carbon fixation', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)mcp|che|mot', attributes[4]):
            table2.append(['Chemotaxis', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)ars|cop|cut|cus|czc|mer', attributes[4]):
            table2.append(['Metal resistance', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)fle|flr|flg|fli|flh', attributes[4]):
            table2.append(['Motility', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)ndh|nuo', attributes[4]):
            table2.append(['NADH dehydrogenase', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)ntr|nif', attributes[4]):
            table2.append(['Nitrogen fixation', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)ahpC|ccmG|dsbE|bcp|efeB|perR|gpmM|icd|degP|trx|fumC|ybbN|cobS', attributes[4]):
            table2.append(['Oxidative stress response', attributes[0], attributes[4], attributes[-1]])
        elif re.match('(?i)bcs|pel|lpx|rfa|lpt|ost|rfb|pga', attributes[4]):
            table2.append(['Polysaccharide', attributes[0], attributes[4], attributes[-1]])

table2.sort(key=lambda x: (x[0], x[2]))
with open('table2.csv', mode='w') as f:
    f.write('Category,ID,Gene,Function\n')
    for line in table2:
        f.write(','.join(line))
        f.write('\n')

with open('table3.csv') as f1, open('table4.csv', mode='w') as f2:
    reader = csv.reader(f1, delimiter=',')
    line = next(reader)
    f2.write(','.join(line + ['name1', 'name2']))
    f2.write('\n')
    for line in reader:
        gene_id = line[0]
        f2.write(','.join(line + [gene1.get(gene_id, ''), gene2.get(gene_id, '')]))
        f2.write('\n')
