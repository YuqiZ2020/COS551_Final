### Code written by Zhiyue

# Goal: generate random sequences of the same length of given lncRNA

import sys
seq_f = "/Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/" + sys.argv[1]
f = open(seq_f,'r')
f_lines = f.readlines()
seq_len = len(f_lines[1].strip())


import random

def rand_RNA(length):
    return ''.join(random.choice('CGTA') for _ in range(length))

for i in range(1, 6):
  seq_rand = rand_RNA(seq_len)
  f_rand_n = "/Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/random/" + sys.argv[2] + "_rand_seq" + str(i) + ".fa"
  f_rand = open(f_rand_n, "w")
  header = ">" + sys.argv[2] + "_rand_seq" + str(i)
  lines = [header,seq_rand]
  f_rand.writelines("\n".join(lines) + "\n")
  f_rand.close()

  

f.close()