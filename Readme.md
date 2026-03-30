
# SPIT GPU Docs 

Use this for coding and running your tasks if you want to use GPUs.

Always run your code on a local machine, and once its running fine without any error only then move it over GPU.

Checkout the video  over here: https://youtu.be/jgjSj-YrQgs?si=sehbIE1ZT_F5-yPy

---

## For sbatch

Write your code in `main.py`. You are allowed to create multiple files and link them with `main.py`.

Update `start.sh`:

```sh
#SBATCH --job-name=gpu_test        # Name your job (should match its purpose)
#SBATCH --partition=general       # Do not change this
#SBATCH --gres=gpu:2              # gpu:1 uses 1 GPU, gpu:2 uses both GPUs
#SBATCH --cpus-per-task=32        # Use multiple CPU cores (< 100)
#SBATCH --mem=120G                # Max RAM (< 250G)
#SBATCH --time=7-00:00:00         # Max runtime (7 days)
````

Install required packages:

```sh
echo "Installing packages"
uv pip install torch torchvision matplotlib tqdm
```

Once completed, submit your job:

```sh
sbatch start.sh
```

To check job status:

```sh
squeue -l
```

---

## For Interactive Apps

You can use interactive apps for development and testing.

Clone this repo repo with `git clone` and update it with your code. 

---

### VS Code Setup

```sh
module load python/3.11.14     # Load Python
uv venv rio_env      
         # Create virtual environment
source rio_env/bin/activate   # Activate environment

uv pip install <packages>     # Install dependencies
python main.py                # Run your script
```

---

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

For any queries, contact: rehan.ansari24@spit.ac.in

---

Maintained by Rehan Ansari
