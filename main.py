import os
import time
import torch
import torch.nn as nn
import torch.optim as optim
import matplotlib.pyplot as plt

# 1. BASIC SETUP

print("Starting script...", flush=True)

device_count = torch.cuda.device_count()
print(f"Detected GPUs: {device_count}", flush=True)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Using device: {device}", flush=True)

os.makedirs("outputs/plots", exist_ok=True)

# 2. DATASET (USER MODIFIES)

"""
Replace this section with your dataset.

Examples:
- torchvision.datasets (CIFAR, MNIST)
- custom Dataset class
- CSV / tabular data
"""

train_loader = None
test_loader = None

# 3. MODEL (USER MODIFIES)

"""
Replace this with your model.

Examples:
- Linear Regression
- CNN
- GAN
- Transformer
"""

model = None

# Multi-GPU support
if device_count > 1:
    print("Using DataParallel across GPUs", flush=True)
    model = torch.nn.DataParallel(model)

if model is not None:
    model = model.to(device)

# 4. LOSS + OPTIMIZER

criterion = None
optimizer = None

"""
Examples:
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)
"""

# 5. TRAINING LOOP

losses = []
accuracies = []

start_time = time.time()
epoch = 0


print("Training started...", flush=True)
print(start_time)
while (true): # have your condition or anything form here

    if model is None or train_loader is None:
        print("Define model and train_loader first.", flush=True)
        break

    model.train()
    running_loss = 0

    for batch in train_loader:

        """
        Example:
        images, labels = batch
        images = images.to(device)
        labels = labels.to(device)
        """

        # TODO: Move data to device

        # optimizer.zero_grad()
        # outputs = model(inputs)
        # loss = criterion(outputs, targets)
        # loss.backward()
        # optimizer.step()

        # running_loss += loss.item()

        if time.time() - start_time > MAX_TIME:
            break

    avg_loss = 0  # replace with real calculation
    
    # 6. EVALUATION (OPTIONAL)
    
    acc = 0  # replace with evaluation logic

    print(f"Epoch {epoch} | Loss {avg_loss:.4f} | Accuracy {acc:.2f}%", flush=True)

    losses.append(avg_loss)
    accuracies.append(acc)

    epoch += 1

# 7. SAVE PLOTS

print("Saving plots...", flush=True)

if len(losses) > 0:
    plt.figure()
    plt.plot(losses)
    plt.title("Training Loss")
    plt.xlabel("Epoch")
    plt.ylabel("Loss")
    plt.savefig("outputs/plots/loss.png")

if len(accuracies) > 0:
    plt.figure()
    plt.plot(accuracies)
    plt.title("Accuracy")
    plt.xlabel("Epoch")
    plt.ylabel("Accuracy")
    plt.savefig("outputs/plots/accuracy.png")

print("Finished.", flush=True)