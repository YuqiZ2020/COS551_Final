### Code written by Zhiyue adapted from Tim's code for similar goals

# Goal: generate heatmap visualizing pairwise correlations between lncRNA kmer profiles

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

def create_heatmap_from_file(file_path, output_image_path):
    df = pd.read_csv(file_path, sep='\t', comment='#', header=None, index_col=0)

    sequence_names = df.index

    df.columns = sequence_names

    for i in range(len(df)):
        for j in range(i):
            df.iloc[i, j] = df.iloc[j, i]

    df.replace('-', 1, inplace=True)
    df = df.astype(float)
    plt.figure(figsize=(10, 8))
    sns.heatmap(df, annot=True, cmap='coolwarm', fmt='.2f')
    plt.title('Pairwise Comparison Heatmap')
    plt.xticks(rotation=45, ha='right')
    plt.yticks(rotation=0)
    plt.tight_layout()
    plt.savefig(output_image_path)

file_path = 'comparison_table'
output_image_path = 'COS551_Final/heatmap_output.png'
create_heatmap_from_file(file_path, output_image_path)

