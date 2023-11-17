gunzip -f gencode.vM33.lncRNA_transcripts.fa.gz

# linearize fasta file
cat gencode.vM33.lncRNA_transcripts.fa | awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' > gencode.vM33.lncRNA_transcripts_linear.fa

# extract Xist gene sequence
gene="Xist"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Xist|17946" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_seq.fa

# extract Kcnq1ot1 gene sequence
gene="Kcnq1ot1"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Kcnq1ot1|93092" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_seq.fa

# extract Airn (unspliced) gene sequence, uploaded from local
cat Mus_musculus_Airn_sequence.fa | awk '/^>/ {printf("%s%s\t",(N>0?"\n":""),$0);N++;next;} {printf("%s",$0);} END {printf("\n");}' | tr '\t' '\n' > Airn_seq.fa
vim Airn_seq.fa
# Within vim: 
:%s/\r//g 
# Exit vim

