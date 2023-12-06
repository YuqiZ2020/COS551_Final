ls data/DNA_seq/*.fa > temp.txt
../software/dashing2 sketch --outprefix results/param_tuning/ -k 7 -S 2048 --cache --cmpout results/mice_k7_size2048.txt -F temp.txt
rm temp.txt
