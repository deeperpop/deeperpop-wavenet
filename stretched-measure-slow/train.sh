#!/usr/bin/env sh
python ../tensorflow-wavenet/train.py \
  --data_dir /farmshare/user_data/connorb3/deeperpop/data/wav/stretched/ \
  --silence_threshold 0.0 \
  --learning_rate 0.0001 \
  --logdir /farmshare/user_data/connorb3/deeperpop/model/stretched-measure/
