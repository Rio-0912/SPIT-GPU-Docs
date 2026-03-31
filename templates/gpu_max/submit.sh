#!/bin/bash
#SBATCH --job-name=gpu_max
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=112
#SBATCH --mem=120G
#SBATCH --gres=gpu:2
#SBATCH --time=3-00:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

cd "$SLURM_SUBMIT_DIR"
echo "Starting MAX resource job on $HOSTNAME."
echo "Assigned GPUs: $CUDA_VISIBLE_DEVICES"

# Load your environment here
# torchrun --nproc_per_node=2 train.py
