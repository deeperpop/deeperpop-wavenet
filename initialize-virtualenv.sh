#!/usr/bin/env bash
# Initialize the virtual environment
virtualenv --system-site-packages .

# Enter the virtual environment
source ./bin/activate

# Ensure pip is installed (and up-to-date)
easy_install -U pip

# Make sure we have the good protobuf
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/protobuf-3.1.0-cp27-none-linux_x86_64.whl

# Install tensorflow
pip install --upgrade tensorflow-gpu

# Install librosa
pip install --upgrade librosa

# Deactivate the virtual environment
deactivate
