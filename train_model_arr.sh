#!/bin/bash

#SBATCH --job-name=scrna_train_array
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2

#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=40Gb
#SBATCH --mail-type FAIL

module load cuda-8.0

CUDNN_ROOT=$HOME/cudnn/cuda
export LD_LIBRARY_PATH=$CUDNN_ROOT/lib64:$LD_LIBRARY_PATH
export CPATH=$CUDNN_ROOT/include:$CPATH
export LIBRARY_PATH=$CUDNN_ROOT/lib64:$LIBRARY_PATH


mapfile -t job_commands < train_commands.list

${job_commands[$SLURM_ARRAY_TASK_ID]}