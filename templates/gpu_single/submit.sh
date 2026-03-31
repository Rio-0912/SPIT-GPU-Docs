#!/bin/bash
#SBATCH --job-name=gpu_single
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --gres=gpu:1
#SBATCH --time=1-00:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

cd "${SLURM_SUBMIT_DIR:?SLURM_SUBMIT_DIR is not set}" || { echo "Error: Failed to change directory to SLURM_SUBMIT_DIR ($SLURM_SUBMIT_DIR)" >&2; exit 1; }
echo "Starting GPU job on $HOSTNAME. Assigned GPU(s): $CUDA_VISIBLE_DEVICES"

# Load your environment here
# module load miniconda3
# conda activate my_env
# python train.py
