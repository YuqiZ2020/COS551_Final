#!/bin/bash

#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=6GB         # memory per cpu-core (4G is default)
#SBATCH --time=48:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=begin        # send email when job begins
#SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-user=tk9066@princeton.edu
#SBATCH --out=chrombpnet.out

mamba init
source ~/.bashrc

mamba create -n dashing
mamba activate dashing
mamba install -c conda-forge gcc

lsb_release -a
lscpu

git clone https://github.com/dnbaker/dashing2-binaries/
xz -d dashing2-binaries/linux/v2.1.19/*
mv dashing2-binaries/linux/v2.1.19/* .
