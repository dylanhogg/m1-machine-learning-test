#!/bin/bash
set -e

# Create a conda environment with Tensorflow for Apple M1 GPUs

# Refs:
# https://github.com/conda-forge/miniforge/
# https://developer.apple.com/metal/tensorflow-plugin/
# https://github.com/mrdbourke/m1-machine-learning-test

echo "***** CREATE: conda evironment"
conda create --prefix ./env
eval "$(conda shell.bash hook)"
conda activate ./env

echo "***** INSTALLING: tensorflow-deps (incl python and pip)..."
conda install -y -c apple tensorflow-deps==2.7.0

echo "***** INSTALLING: tensorflow-macos..."
python -m pip install tensorflow-macos

echo "***** INSTALLING: tensorflow-metal..."
python -m pip install tensorflow-metal

echo "***** INSTALLING: tensorflow-datasets..."
python -m pip install tensorflow-datasets

echo "***** INSTALLING: jupyter and friends..."
conda install -y jupyterlab pandas numpy matplotlib scikit-learn

python --version
conda list | grep tensorflow

echo "activate env with: 'conda activate ./env'"
echo "run jupyter with: jupyter lab'"
