import sys
seq_f = "/Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/" + sys.argv[1]
f = open(seq_f,'r')
f_lines = f.readlines()

seq = f_lines[1].strip()

# shuffle nucleotides to create random sequence of same TCGA ratio
import random
nucleotides = list(seq)

# write to file
for i in range(1, 51):
  random.shuffle(nucleotides)
  seq_rand = ''.join(nucleotides)
  f_rand_n = "/Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/shuffled/" + sys.argv[2] + "_shuffled_seq" + str(i) + ".fa"
  f_rand = open(f_rand_n, "a")
  f_rand.writelines([f_lines[0], seq_rand])
  f_rand.close()

f.close()