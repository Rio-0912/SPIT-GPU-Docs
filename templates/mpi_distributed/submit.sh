#!/bin/bash
#SBATCH --job-name=mpi_job
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --time=06:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err

cd "${SLURM_SUBMIT_DIR:-$PWD}" || exit 1
echo "Starting MPI job with $SLURM_NTASKS tasks."

# Load MPI module if available, then run using srun so Slurm manages MPI ranks:
# srun ./my_mpi_program
# (Use mpirun only if your cluster documentation explicitly recommends it.)
# (Use mpirun only if your cluster documentation explicitly recommends it.)
