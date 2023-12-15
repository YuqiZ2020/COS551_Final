> data/param_tuning_files.txt
for i in {1..3}
do
    echo data/DNA_seq/shuffled/Xist_shuffled_seq$i.fa >> data/param_tuning_files.txt
    echo data/DNA_seq/shuffled/Airn_shuffled_seq$i.fa >> data/param_tuning_files.txt
    echo data/DNA_seq/shuffled/Kcnq1ot1_shuffled_seq$i.fa >> data/param_tuning_files.txt
done
echo data/DNA_seq/Xist_M_rep.fa >> data/param_tuning_files.txt
echo data/DNA_seq/Kcnq1ot1_M_rep.fa >> data/param_tuning_files.txt
echo data/DNA_seq/Airn_M_rep.fa >> data/param_tuning_files.txt

for i in {6..31}
do
    ../software/dashing2 sketch --outprefix results/param_tuning/ -k $i --cache --cmpout results/param_tuning_k$i.txt -F data/param_tuning_files.txt
done
# python3 table_to_heatmap.py
