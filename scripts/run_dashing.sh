mkdir my_sketches
./dashing2 sketch --outprefix my_sketches -k 8 --cache --cmpout comparison_table COS551_Final/data/DNA_seq/*
python3 table_to_heatmap.py
