f = open("Xist_seq.fa",'r')
f_lines = f.readlines()

seq = f_lines[1].strip()

# shuffle nucleotides to create random sequence of same TCGA ratio
import random
nucleotides = list(seq)
random.shuffle(nucleotides)
seq_rand = ''.join(nucleotides)

# write to file
f_rand = open("Xist_shuffled_seq.fa", "a")
f_rand.writelines([f_lines[0], seq_rand])
f_rand.close()

f.close()
