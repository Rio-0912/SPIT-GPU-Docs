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

cd "$SLURM_SUBMIT_DIR"
echo "Starting CPU job on $HOSTNAME with $SLURM_CPUS_PER_TASK cores."

# Load your environment here
# module load python/3.11.14
# python my_script.py
