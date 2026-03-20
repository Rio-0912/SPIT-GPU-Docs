#!/bin/bash
#SBATCH --job-name=gpu_test
#SBATCH --partition=general
#SBATCH --gres=gpu:2
#SBATCH --cpus-per-task=32
#SBATCH --mem=120G
#SBATCH --time=00:03:00
LOGFILE="run.log"

# Redirect EVERYTHING into run.log
exec > >(tee -a $LOGFILE) 2>&1

echo "===================================="
echo "JOB START"
date
echo "===================================="

echo "Loading Python module"
module load python/3.11.14

echo "Creating virtual environment"
uv venv env

echo "Activating environment"
source env/bin/activate

echo "Installing packages"
uv pip install torch torchvision matplotlib tqdm

echo "Starting training"
python -u main.py

echo "===================================="
echo "JOB FINISHED"
date
echo "===================================="
