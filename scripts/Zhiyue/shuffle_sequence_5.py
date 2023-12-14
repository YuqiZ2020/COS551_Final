### Code written by Zhiyue

# Goal: generate shuffled sequences of the same length and nucleotide percentage of given lncRNA

import sys
seq_f = "/Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/" + sys.argv[1]
f = open(seq_f,'r')
f_lines = f.readlines()

seq = f_lines[1].strip()

# shuffle nucleotides to create random sequence of same TCGA ratio
import random
nucleotides = list(seq)

# write to file
for i in range(1, 6):
  random.shuffle(nucleotides)
  seq_rand = ''.join(nucleotides)
  f_rand_n = "/Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/shuffled_5/" + sys.argv[2] + "_shuffled_seq" + str(i) + ".fa"
  f_rand = open(f_rand_n, "w")
  header = ">" + sys.argv[2] + "_shuffled_seq" + str(i)
  lines = [header,seq_rand]
  f_rand.writelines("\n".join(lines) + "\n")
  f_rand.close()

f.close()