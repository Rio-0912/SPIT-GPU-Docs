# SPIT GPU Docs 

Use this for coding and running your tasks if you want to use GPUs.

Always run your code on a local machine, and once it's running fine without any error only then move it over GPU.

Checkout the video over here: https://youtu.be/jgjSj-YrQgs?si=sehbIE1ZT_F5-yPy
## !!! IMPORTANT: GPU ACCESS IS LIMITED FOR INTERACTIVE APPS !!!
Interactive apps (Jupyter, Code) have a max time limit of 1.5 hours.
If the training requires more time till 7 days which is max job time,
submit the job via sbatch.
Refer documentation if needed.
---

# WELCOME TO THE SPIT GPU CLUSTER

### System Hardware & Limits:
  * **CPUs:** Dual AMD EPYC (224 Threads, 112 Cores)
  * **GPUs:** 2x NVIDIA RTX A6000
  * **RAM:**  250 GB
  * **Max Job Time:** 7 Days (Partition: `general`)



---

# GPU SOFTWARE ENVIRONMENT GUIDE

Software on this cluster is managed via Modules. 
You do NOT need to install Python/Conda manually.

To see available software:
```sh
module avail
```

To load Python 3.11:
```sh
module load python/3.11.14
```

To create a fast virtual environment (Recommended):
```sh
uv venv my_env
source my_env/bin/activate
uv pip install torch torchvision
```

To use Conda instead:
```sh
module load miniconda3
conda create -n my_project python=3.11
conda activate my_project
```

---

# CONTAINERS (APPTAINER) 

Need a complex environment or NVIDIA NGC container?
Use Apptainer to run Docker images securely in user-space.

Pull a Docker image:
```sh
apptainer pull pytorch.sif docker://nvcr.io/nvidia/pytorch:24.02-py3
```

Run with GPU support (--nv flag binds the host GPUs):
```sh
apptainer exec --nv pytorch.sif python script.py
```


# Need a specific software package or version?
# Please contact the GPU administrators to request a new module.


---

## Templates Guide

We have added several boilerplate submission scripts to the `templates/` directory to help you get started quickly. These templates cover various use cases:

* **`cpu_worker/`**: For CPU-intensive tasks requiring no GPUs. Optimized with 16 cores and 32GB RAM.
* **`gpu_single/`**: Standard AI/ML job using 1 GPU, 32 CPU cores, and 64GB RAM. Ideal for most training tasks.
* **`gpu_max/`**: For heavy, multi-GPU workloads. Requests all 2 GPUs, 112 cores, and 120GB RAM (max limits). Use only when absolutely necessary!
* **`mpi_distributed/`**: Template for running MPI CPU jobs without GPUs (64 tasks/cores).
* **`gpu_apptainer/`**: Specifically structured for running containerized AI jobs (Docker/NGC) via Apptainer with GPU binding enabled.

To use a template, simply copy its `submit.sh` into your project directory and modify it. For example:
```sh
cp templates/gpu_single/submit.sh my_project/
cd my_project/
sbatch submit.sh
```

---

## Quickstart: sbatch

Write your code in `main.py`. You are allowed to create multiple files and link them with `main.py`.

You can adapt a script from `templates/` use  [`start.sh`](https://github.com/Rio-0912/SPIT-GPU-Docs/blob/master/start.sh) in template 

Submit your job:
```sh
sbatch start.sh
```

To check job status:
```sh
squeue -l
```

Check GPU utilization using nvidia-smi during your job. Look for high GPU usage (%) and memory consumption.
Use a short test job: `#SBATCH --time=00:05:00`

Monitor in real time: `watch -n 1 nvidia-smi`.
If usage is low, the job may be CPU-bound, using a small batch size, or not properly configured for GPU.

---

## Interactive Apps

For interactive apps like Desktop mode, Jupyter Notebook, and VS Code, visit **[cluster.gpu.spit.ac.in](http://cluster.gpu.spit.ac.in)** and navigate to the **Interactive Apps** section.

You can use these interactive apps for development and testing.

Clone this repo with `git clone` and update it with your code. 

### VS Code Setup

```sh
module load python/3.11.14       # Load Python
uv venv rio_env                  # Create virtual environment
source rio_env/bin/activate      # Activate environment

uv pip install <packages>        # Install dependencies
python main.py                   # Run your script
```

### Jupyter
Use the `main.ipynb` file as a template for your notebook.

---

## Best Practices

* Match your `--job-name` with the task (helps in tracking jobs).
* Always test locally or with small inputs before using GPUs.
* Use `gpu:1` unless you really need multiple GPUs.
* Monitor memory usage to avoid job crashes.
* Save outputs and logs properly (use `--output` in sbatch if needed).
* Use virtual environments to avoid dependency conflicts.
* Keep your code modular instead of dumping everything in one file.
* Use logging instead of print statements for long jobs.

---

## Terms & Conditions

- GPUs must only be used for the approved task. Misuse may result in a 2-year ban.
- Interactive apps must not be used for more than 2 hours continuously.

For any queries or help with cluster GPU-related issues, contact:
- varun.jhaveri23@spit.ac.in
- rehan.ansari24@spit.ac.in

---

Maintained by Rehan Ansari & Varun Jhaveri
