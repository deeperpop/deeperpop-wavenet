#!/usr/bin/env bash
#######################
## SBATCH Parameters ##
#######################
# Job parameters
#SBATCH --job-name=tf-wavenet-default
#SBATCH --output=train.log
#SBATCH --open-mode=append
#SBATCH --dependency=singleton

# Partition parameters
#SBATCH --partition=gpu
#SBATCH --time=8:00:00

# GPU parameters
#SBATCH --cpus-per-task=1 --cores-per-socket=1 --gres=gpu:1
#SBATCH --gres-flags=enforce-binding

# Mail parameters
#SBATCH --mail-type=ALL
#SBATCH --mail-user=brinton@cs.stanford.edu

# Source lmod script
source /usr/share/lmod/lmod/init/bash

# Load cudnn
module load cudnn

# Activate virtualenv (which contains tensorflow)
source ../bin/activate

# Execute training script
source train.sh
