import os
import pandas as pd

# Directory containing your .txt files
directory = "/Genomics/pritykinlab/yanjin/COS551/COS551_Final/data/DNA_seq/align_seq_with_clustw"

# Iterate through each file in the directory
data_list = []
for filename in os.listdir(directory):
    if filename.endswith(".txt"):
        filepath = os.path.join(directory, filename)
        score = 0  # Default score
        similarity = 0
        length = 1 #avoid dividing by 0
        for name in ["# Score", "# Similarity", "# Length"]:
            with open(filepath, 'r') as file:
                for line in file:
                    if line.startswith(name):
                        if name == "# Score":
                            score = line.strip().split(":")[1].strip()
                        elif name == "# Similarity":
                            similarity = line.strip().split(":")[1].strip()
                        else:
                            length =  line.strip().split(":")[1].strip()
                        break
        data_list.append({"name":filename,"score":score,"similarity":similarity, "length": length})

df = pd.DataFrame(data_list)
df.to_csv("/Genomics/pritykinlab/yanjin/COS551/COS551_Final/data/DNA_seq/align_seq_with_clustw/alignment_score.csv")
           
