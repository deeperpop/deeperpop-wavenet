"""
Utility for extracting loss information for each step from log files.
"""
import argparse
import os
import re

import pandas as pd


LOSS_REPORT_RE = re.compile("step (\\d+) - loss = ([\\d\\.]+), \([\\d\\.]+ sec/step\)")


def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("folder", help="Folder containing log file.")
    args = parser.parse_args()

    # Get log filepath
    log_filepath = os.path.join(args.folder, "train.log")

    # Step -> loss value map
    step_loss = {}

    # For each line in log file
    with open(log_filepath, "r") as log_file:
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

    # Output the step loss as a CSV
    step_loss.to_csv(os.path.join(args.folder, "train.csv"), header=True)


if __name__ == "__main__":
    main()
