f = open("Xist_seq.fa",'r')
f_lines = f.readlines()

seq = f_lines[1].strip()

# shuffle nucleotides to create random sequence of same TCGA ratio
import random
nucleotides = list(seq)

# write to file
for i in range(1, 51):
  random.shuffle(nucleotides)
  seq_rand = ''.join(nucleotides)
  f_rand_n = "Xist_shuffled_seq" + str(i) + ".fa"
  f_rand = open(f_rand_n, "a")
  f_rand.writelines([f_lines[0], seq_rand])
  f_rand.close()

f.close()
