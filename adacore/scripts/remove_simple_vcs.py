#!/usr/bin/env python

import argparse
import config
import e3.yaml
import json
import os.path
import shutil
import subprocess

descr = """
The main argument is a json file which contains all the prover results.
The script deletes vcs which are proved by all provers. It assumes that
vcs are given in their respectve prover sub-directories.
"""

DEBUG_PRINT = False


def parse_arguments():
    args = None
    parser = argparse.ArgumentParser(description=descr)
    parser.add_argument(
        "--benchdir",
        type=str,
        default=None,
        required=True,
        help="directory to be run on"
    )
    parser.add_argument(
        "resultfile",
        metavar="F",
        help="JSON file that contains all results",
    )
    args = parser.parse_args()
    return args


def unique_id(x):
    return (x["testname"], os.path.splitext(x["filename"])[0])


def compute_unproved_vcs(data):
    """return the pairs (testname, basename) for VCs that are not proved by at
    least one prover, where basename is filename without the prover extension.
    """
    return {unique_id(x) for x in data if x["status"] != "unsat"}


def remove_simple_vcs(data, benchdir, unproved_vcs):
    """only keep VCs which are not proved by at least one prover. Delete others.
    """
    for x in data:
        vc = os.path.join(benchdir, x["testname"], x["prover"], x["filename"])
        if unique_id(x) not in unproved_vcs:
            os.remove(vc)
            if DEBUG_PRINT:
                print(f"deleting {vc}")
        else:
            if DEBUG_PRINT:
                print(f"keeping {vc}")


def main():
    args = parse_arguments()
    with open(args.resultfile, "r") as f:
        data = json.load(f)
    unproved_vcs = compute_unproved_vcs(data["results"])
    remove_simple_vcs(data["results"], args.benchdir, unproved_vcs)


if __name__ == "__main__":
    main()
