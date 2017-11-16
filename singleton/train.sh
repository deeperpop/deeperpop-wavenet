#!/usr/bin/env sh
python ../tensorflow-wavenet/train.py \
  --data_dir /farmshare/user_data/connorb3/deeperpop/data/wav/singleton/ \
  --store_metadata True \
  --silence_threshold 0.0 \
  --logdir /farmshare/user_data/connorb3/deeperpop/model/singleton/
