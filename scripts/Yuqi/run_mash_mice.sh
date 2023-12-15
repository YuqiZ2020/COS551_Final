ls data/DNA_seq/*.fa > temp.txt
i=11
j=2048
../software/mash sketch -k $i -s $j -l temp.txt -o results/mash_ref_k${i}_size${j}
../software/mash dist results/mash_ref_k${i}_size${j}.msh -l temp.txt > results/mash_out_k${i}_size${j}.txt
rm temp.txt
