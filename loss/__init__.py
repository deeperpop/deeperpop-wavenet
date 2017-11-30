"""
Common utilities for handling loss computations in deeperpop-wavenet.
"""
import re

import pandas as pd


LOSS_REPORT_RE = re.compile("step (\\d+) - loss = ([\\d\\.]+), \\([\\d\\.]+ sec/step\\)")


def get_loss(log_file):
    """
    Get the loss from the training log file given.
    """
    # Step -> loss value map
    step_loss = {}

    # For each line in log file
    for line in log_file:
        # Try to match loss reporting line
        match = LOSS_REPORT_RE.match(line)

        if match is None:
            continue

        # Record loss
        step = int(match.group(1))
        loss = float(match.group(2))
        step_loss[step] = loss

    # Convert step_loss to Series
    step_loss = pd.Series(step_loss, name="loss")
    step_loss.index.rename("step", inplace=True)

    # Sort steps
    step_loss = step_loss.sort_index()

    return step_loss
