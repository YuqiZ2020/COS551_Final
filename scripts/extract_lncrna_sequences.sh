# mice cis-activating lncRNAs

gene="Hottip"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Hottip-202" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_act.fa

gene="Gm16084"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Gm16084" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_act.fa

gene="Gm13261"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Gm13261" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_act.fa


# mice repressive lncRNAs 
gene="Kcnq1ot1"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Kcnq1ot1|93092" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_rep.fa

gene="Tsix"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Tsix-201" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_rep.fa

gene="Xist"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Xist|17946" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_rep.fa

gene="Nespas"
grep $gene gencode.vM33.lncRNA_transcripts.fa
grep "Gnasas1-202" gencode.vM33.lncRNA_transcripts_linear.fa | tr '\t' '\n' > ${gene}_M_rep.fa

