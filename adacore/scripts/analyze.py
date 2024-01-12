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
The script generates files in the same dir as the argument file, which list
results per prover.
"""


def parse_arguments():
    args = None
    parser = argparse.ArgumentParser(description=descr)
    parser.add_argument(
        "resultfile",
        metavar="F",
        help="JSON file that contains all results",
    )
    args = parser.parse_args()
    return args


def represent_same_vc(f1, f2):
    """return whether f1 and f2 represent the same VC"""
    base1 = os.path.splitext(f1)[0]
    base2 = os.path.splitext(f2)[0]
    return base1 == base2


def compare_baseline(data, prover, fn):
    """results is a list of all results. We extract interesting information
    for the given prover.
    """
    local_data = [x for x in data if x["prover"] == prover]
    total = len(local_data)
    unsat = len([x for x in local_data if x["status"] == "unsat"])
    unproved = [x for x in local_data if x["status"] != "unsat"]
    if total == 0:
        fn.write("VC count for " + prover + " is 0\n")
        return
    fn.write(f"{prover} proved {unsat} out of {total} VCs\n")
    unproved.sort(key=lambda x: x["filename"])
    for vc in unproved:
        vc_name = vc["filename"]
        other_proved = [x for x in data
                        if represent_same_vc(x["filename"], vc_name)
                        and x["status"] == "unsat"]
        other_provers = [x["prover"] for x in other_proved]
        fn.write (
            f"  unproved {vc_name}"
            + (f" (proved by {other_provers})" if len(other_provers) > 0 else "")
            + "\n"
        )


def compute_test_status(outdir, test, data):
    with open(os.path.join(outdir, test + ".diff"), "w") as diff_fn:
        for prover in config.all_provers:
            compare_baseline(data, prover, diff_fn)


def compute_stat_count(data):
    keys = {x["status"] for x in data}
    result = {}
    for elt in keys:
        result[elt] = sum(x["status"] == elt for x in data)
    return result


def compute_results(data, outdir):
    alltests = {x["testname"] for x in data}
    for test in alltests:
        testdata = [x for x in data if x["testname"] == test]
        with open(os.path.join(outdir, test + ".out"), "w") as f:
            for p in config.all_provers:
                proverdata = [x for x in testdata if x["prover"] == p]
                f.write(p + ":")
                f.write(str(compute_stat_count(proverdata)))
                f.write("\n")
        compute_test_status(outdir, test, testdata)


def produce_version_output(outdir):
    with open(os.path.join(outdir, "version.out"), "w") as f:
        for p in config.all_provers:
            exec_name = "alt-ergo" if p == "altergo" else p
            f.write(subprocess.check_output([exec_name, "--version"]).decode("utf-8"))


def main():
    args = parse_arguments()
    with open(args.resultfile, "r") as f:
        data = json.load(f)
    outdir = os.path.dirname(args.resultfile)
    produce_version_output(outdir)
    compute_results(data["results"], outdir)


if __name__ == "__main__":
    main()
