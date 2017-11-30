"""
Utility for extracting loss information for each step from log files.
"""
import argparse
import os

import matplotlib as mpl
import matplotlib.pyplot as plt

import loss


def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("command", help="Either 'plot' or 'write'.")
    parser.add_argument("folder", help="Folder containing log file.")
    args = parser.parse_args()

    # Verify command
    if args.command not in ['plot', 'write']:
        raise Exception("Unknown command {}".format(args.command))

    # Get log filepath
    log_filepath = os.path.join(args.folder, "train.log")

    # Get loss values from file
    with open(log_filepath, "r") as log_file:
        step_loss = loss.get_loss(log_file)


    # Branch by command
    if args.command == "write":
        # Output the step loss as a CSV
        step_loss.to_csv(os.path.join(args.folder, "train.csv"), header=True)
    elif args.command == "plot":
        # Show plot of loss
        step_loss.plot()
        plt.ylim(0)
        plt.show()


if __name__ == "__main__":
    main()
