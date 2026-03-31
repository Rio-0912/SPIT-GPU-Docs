#!/bin/bash
#SBATCH --job-name=apptainer_gpu
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --gres=gpu:1
#SBATCH --time=12:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

cd "$SLURM_SUBMIT_DIR"

CONTAINER="my_container.sif"
SCRIPT="train.py"

echo "Running $SCRIPT inside $CONTAINER on $HOSTNAME"
# --nv flag binds the host GPUs into the container
apptainer exec --nv $CONTAINER python $SCRIPT
