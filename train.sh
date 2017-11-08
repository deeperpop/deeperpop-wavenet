#!/usr/bin/env sh
cd tensorflow-wavenet
python train.py --data_dir /farmshare/user_data/connorb3/deeperpop/data/wav/ --store_metadata True  --silence_threshold 0.0 --logdir /farmshare/user_data/connorb3/deeperpop/model/
