#!/usr/bin/env bash
# Declare variables (parameters)
MODEL_NAME="stretched-subset-slow"
TENSORFLOW_WAVENET_PATH="/farmshare/user_data/connorb3/deeperpop/deeperpop-wavenet/tensorflow-wavenet/"
MODEL_PATH="/farmshare/user_data/connorb3/deeperpop/model/$MODEL_NAME/"
SEED_PATH="/farmshare/user_data/connorb3/deeperpop/data/wav/seeds/seed1.wav"
OUTPUT_PATH="/farmshare/user_data/connorb3/deeperpop/results/$MODEL_NAME/"

# Select sample number
SAMPLE_NUMBER="1"
SAMPLE_PATH="$OUTPUT_PATH/$SAMPLE_NUMBER"

# Create sample output path
mkdir "$SAMPLE_PATH"

# Perform generation
python "${TENSORFLOW_WAVENET_PATH}generate.py" \
    --samples 160000 \
    --logdir "$SAMPLE_PATH" \
    --wav_seed "$SEED_PATH" \
    --wav_out_path "$SAMPLE_PATH/sample$SAMPLE_NUMBER.wav" \
    "${MODEL_PATH}model.ckpt-99999"
