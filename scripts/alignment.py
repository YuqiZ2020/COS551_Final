from Bio import pairwise2
from Bio.pairwise2 import format_alignment
import pandas as pd
def read_fasta(fasta_file):
    with open(fasta_file, 'r') as file:
        header = None
        sequence = ''
        for line in file:
            line = line.strip()
            if line.startswith('>'):
                if header:
                    yield (header, sequence)
                header = line[1:]  # Remove '>'
                sequence = ''
            else:
                sequence += line
        yield (header, sequence)

fasta_file = '/Genomics/pritykinlab/yanjin/COS551/COS551_Final/data/DNA_seq/combined.fa'
fasta_dict = {}
for header, sequence in read_fasta(fasta_file):
    fasta_dict[header] = sequence
   
header_list = []
for header, sequence in read_fasta(fasta_file):
    header_list.append(header)

datalist = []

for i in range(10,len(header_list)):
    alignments = pairwise2.align.localxx(fasta_dict[header_list[0]], fasta_dict[header_list[i]])
    print(header_list[0],header_list[i],alignments[0].score)
    datalist.append({"name1":header_list[0],"name2":header_list[i],"score":alignments[0].score})

df = pd.DataFrame(datalist)
df.to_csv("alignment_score000.csv",index = False)