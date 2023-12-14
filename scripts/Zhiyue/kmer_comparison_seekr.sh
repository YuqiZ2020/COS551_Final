### Code written by Zhiyue

# Goal: running SEEKR kmer comparison on selected groups of lncRNA

# create normalization factors based on entire mouse lncRNA transcriptome
seekr_norm_vectors all_mouse_lncRNA_transcripts_formatted.fa  -k 6  -l pre -mv mean_6mers.npy -sv std_6mers.npy

# count kmers and calculate z-scores for selected groups of lncRNAs
seekr_kmer_counts reg_mouse_lncRNA_formatted.fa -o reg_mouse_lncRNA_6mers.csv -k 6  -l pre -mv mean_6mers.npy -sv std_6mers.npy
seekr_kmer_counts reg_shuffled_random_lncRNA.fa -o reg_shuffled_random_lncRNA_6mers.csv -k 6  -l pre -mv mean_6mers.npy -sv std_6mers.npy

seekr_kmer_counts xka_shuffled_random_seq.fa -o xka_shuffled_random_6mers.csv -k 6  -l pre -mv mean_6mers.npy -sv std_6mers.npy
seekr_kmer_counts xka_seq.fa -o xka_6mers.csv -k 6  -l pre -mv mean_6mers.npy -sv std_6mers.npy

# calculate correlations between the kmer profiles of each pair of lncRNA
seekr_pearson reg_shuffled_random_lncRNA_6mers.csv reg_mouse_lncRNA_6mers.csv -o all_v_reg.csv
seekr_pearson xka_shuffled_random_6mers.csv xka_6mers.csv -o xka_v_xka.csv
seekr_pearson all_shuffled_lncRNA_6mers.csv reg_mouse_lncRNA_6mers.csv -o shuffled_v_reg.csv
seekr_pearson reg_mouse_lncRNA_6mers.csv reg_mouse_lncRNA_6mers.csv -o reg_v_reg.csv