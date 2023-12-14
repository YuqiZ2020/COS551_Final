### Code written by Zhiyue

# Goal: format sequence files in preparation for running SEEKR

# format XistAR file
cat XistAR.fa | awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' | tr "\t" "\n" > XistAR_M_act.fa

# generate fa file for all lncRNA sequences
cat /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/gencode.vM33.lncRNA_transcripts.fa Halr1_M_rep.fa XistAR_M_act.fa Ube3a_M_rep.fa Morrbid_M_rep.fa Airn_M_rep.fa > /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/all_mouse_lncRNA_transcripts.fa
cat all_mouse_lncRNA_transcripts.fa | awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' | tr "\t" "\n" > all_mouse_lncRNA_transcripts_formatted.fa

# Within vim: (to remove \M)
:%s/\r//g 

# generate fa file for cis regulatory lncRNAs
cat /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/seq_for_seekr/*.fa > /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/reg_mouse_lncRNA.fa
cd /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/
cat reg_mouse_lncRNA.fa | awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' | tr "\t" "\n" > reg_mouse_lncRNA_formatted.fa

# Within vim: (to remove \M)
:%s/\r//g

# generate fa file for shuffled and random lncRNAs
cd /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/
cat /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/shuffled_5/* > all_shuffled_lncRNA_seq.fa
cat /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/random/* > all_random_lncRNA_seq.fa

# generate fa file for all shuffled, random, and cis regulatory lncRNAs
cat reg_mouse_lncRNA_formatted.fa all_shuffled_lncRNA_seq.fa all_random_lncRNA_seq.fa > reg_shuffled_random_lncRNA.fa

# generate fa file xka sequences and shuffled/random xka sequences
cd /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/DNA_seq/
cat Xist_M_rep.fa Airn_M_rep.fa Kcnq1ot1_M_rep.fa shuffled_5/Xist* shuffled_5/Airn* shuffled_5/Kcnq1ot1* random/Xist* random/Airn* random/Kcnq1ot1* > /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/xka_shuffled_random_seq.fa
cat Xist_M_rep.fa Airn_M_rep.fa Kcnq1ot1_M_rep.fa > /Genomics/singhlab/ancestry_lm/final/COS551_Final/data/all_seq/xka_seq.fa