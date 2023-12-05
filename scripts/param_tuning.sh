> data/param_tuning_files.txt
for i in 1
do
    echo data/DNA_seq/shuffled/Xist_shuffled_seq$i.fa >> data/param_tuning_files.txt
    echo data/DNA_seq/shuffled/Airn_shuffled_seq$i.fa >> data/param_tuning_files.txt
    echo data/DNA_seq/shuffled/Kcnq1ot1_shuffled_seq$i.fa >> data/param_tuning_files.txt
done
echo data/DNA_seq/random/Airn_rand_seq1.fa >> data/param_tuning_files.txt
echo data/DNA_seq/random/Xist_rand_seq1.fa >> data/param_tuning_files.txt
echo data/DNA_seq/random/Kcnq1ot1_rand_seq1.fa >> data/param_tuning_files.txt
echo data/DNA_seq/Xist_M_rep.fa >> data/param_tuning_files.txt
echo data/DNA_seq/Kcnq1ot1_M_rep.fa >> data/param_tuning_files.txt
echo data/DNA_seq/Airn_M_rep.fa >> data/param_tuning_files.txt

for i in 512 1024 2048 4096 8192
do
    for j in {4..31}
    do
	../software/dashing2 sketch --outprefix results/param_tuning/ -k $j -S $i --cache --cmpout results/param_tuning_k${j}_size${i}.txt -F data/param_tuning_files.txt
    done
done
# python3 table_to_heatmap.py
