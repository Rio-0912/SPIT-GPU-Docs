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

cd "${SLURM_SUBMIT_DIR:-$PWD}" || { echo "Error: failed to change directory to \${SLURM_SUBMIT_DIR:-$PWD}" >&2; exit 1; }

CONTAINER="my_container.sif"
SCRIPT="train.py"

# Guard against running with placeholder values
if [ "$CONTAINER" = "my_container.sif" ] || [ "$SCRIPT" = "train.py" ]; then
    echo "ERROR: Please set CONTAINER and SCRIPT to real paths before running this template."
    echo "       Current CONTAINER=\"$CONTAINER\" SCRIPT=\"$SCRIPT\""
    exit 1
fi

echo "Running $SCRIPT inside $CONTAINER on $HOSTNAME"
# --nv flag binds the host GPUs into the container
apptainer exec --nv "$CONTAINER" python "$SCRIPT"
