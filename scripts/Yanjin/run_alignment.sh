#!/bin/bash

#!/bin/bash


##params: object name
##output_dir="/Genomics/pritykinlab/yanjin/COS551/COS551_Final/scripts/${job_name}_${date +%m%d_%H%M}.out"
#SBATCH --job-name=get_alignment_score_000
#SBATCH --output="/Genomics/pritykinlab/yanjin/COS551/COS551_Final/scripts/test_get_tag-slurm-%j.out"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=100GB
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=yc0901@princeton.edu


SECONDS=0

python3 alignment.py


echo $SECONDS SECONDS
