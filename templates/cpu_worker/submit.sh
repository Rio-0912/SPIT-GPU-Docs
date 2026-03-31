#!/bin/bash
#SBATCH --job-name=cpu_job
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=04:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

if [ -n "$SLURM_SUBMIT_DIR" ]; then
    cd "$SLURM_SUBMIT_DIR" || { echo "Failed to change to SLURM_SUBMIT_DIR: $SLURM_SUBMIT_DIR" >&2; exit 1; }
fi
echo "Starting CPU job on $HOSTNAME with $SLURM_CPUS_PER_TASK cores."

# Load your environment here
# module load python/3.11.14
# python my_script.py
