#!/usr/bin/env python

import argparse
import json
import multiprocessing
import os
import os.path
import subprocess
import sys
import config
from util import makedirs_allow_exists

descr = """
   This script expects a directory structure as follows, depending on the value
   of argument 'mode':

   - when 'mode' is 'crafted'

   benchdir
      test1
         file1.smt2
         file2.smt2
         ...
      test2
      ...

   - when 'mode' is 'generated'

   benchdir
      test1
         altergo
            file1.ae
            ...
         colibri
            file1.smt2
            ...
         cvc5
            file1.smt2
            ...
         z3
            file1.smt2
            ...
      test2
      ...

   The "benchdir" contains a number of folders which we call "test".  Each test
   folder contains VC files either directly or under subdirs for each
   prover. This script runs the corresponding prover on all smt files, storing
   the results in JSON files of the form resultdir/test/<provername>.json
"""


def parse_arguments():
    args = None
    parser = argparse.ArgumentParser(description=descr)
    parser.add_argument("benchdir", metavar="F", help="directory to be run on")
    parser.add_argument(
        "--results-dir",
        type=str,
        default=None,
        required=True,
        help="directory in which to store the results",
    )
    parser.add_argument(
        "--mode",
        type=str,
        default=None,
        choices=['crafted', 'generated'],
        required=True,
        help="either crafted or generated",
    )
    parser.add_argument(
        "-j",
        dest="parallel",
        type=int,
        action="store",
        default=1,
        help="number of processes to run in parallel",
    )
    args = parser.parse_args()
    if args.parallel == 0:
        args.parallel = multiprocessing.cpu_count() // 2
    return args


def run_prover(prover, vcdir, resultdir, scriptdir, socket, parallel):
    """
    Run the prover on all VCs in proverdir. Compute provername from
    proverdir. Store the result json file in resultdir. Use socket for
    communication with why3server and run up to [parallel] VCs.
    """
    result_file = os.path.join(resultdir, prover + ".json")
    cmd = [
        "python",
        os.path.join(scriptdir, "prover_stats.py"),
        "--prover=" + prover,
        "-j",
        str(parallel),
        "-t",
        str(config.timelimit),
        "--socket=" + socket,
        "-o",
        result_file,
        vcdir,
    ]
    p = subprocess.Popen(cmd)
    return (p, result_file)


def run_test(args):
    """Run a test. Args contains:
    benchdir: The dir where the VCs are
    socket: socket to use for communication with why3server
    mode: either crafted or generated VCs
    parallel: use up to X processes
    testname: the name of the test
    scriptdir: the place of the scripts
    resultsdir: the place to put result files
    """
    processes = []
    resultsdir = os.path.join(args["resultsdir"], args["testname"])
    makedirs_allow_exists(resultsdir)
    for prover in config.all_provers:
        if args["mode"] == 'crafted':
            vcdir = args["benchdir"]
        else:
            vcdir = os.path.join(args["benchdir"], prover)
        if os.path.isdir(vcdir):
            p = run_prover(
                prover,
                vcdir,
                resultsdir,
                args["scriptdir"],
                args["socket"],
                args["parallel"],
            )
            processes.append(p)
    resultfiles = [x[1] for x in processes]
    processes = [x[0] for x in processes]
    for p in processes:
        p.wait()
    return resultfiles


def consolidate(fnlist, resultsfile):
    result_list = []
    for fn in fnlist:
        with open(fn) as f:
            data = json.load(f)
        for entry in data["results"]:
            entry["filename"] = os.path.basename(entry["filename"])
            entry["prover"] = os.path.splitext(os.path.basename(fn))[0]
            entry["testname"] = os.path.basename(os.path.dirname(fn))
            result_list.append(entry)
    result = {"results": result_list}
    with open(resultsfile, "w") as f:
        json.dump(result, f)


def run_bench(benchdir, mode, parallel, scriptdir, resultsdir):
    socket = os.path.join(resultsdir, "benchsock.sock")
    cmd = ["why3server", "-j", str(parallel), "--logging", "--socket", socket]
    p_why3server = subprocess.Popen(cmd)
    dirs = os.listdir(benchdir)
    args = [
        {
            "testname": d,
            "benchdir": os.path.join(benchdir, d),
            "scriptdir": scriptdir,
            "resultsdir": resultsdir,
            "socket": socket,
            "mode": mode,
            "parallel": parallel,
        }
        for d in dirs
        if os.path.isdir(os.path.join(benchdir, d))
    ]
    with multiprocessing.Pool(parallel) as p:
        result = p.map(run_test, args)
    p_why3server.kill()
    os.remove(socket)
    # flattening list
    json_files = [item for sublist in result for item in sublist]
    consolidate(json_files, os.path.join(resultsdir, "results.json"))


def main():
    args = parse_arguments()
    makedirs_allow_exists(args.results_dir)
    scriptdir = os.path.dirname(os.path.abspath(sys.argv[0]))
    run_bench(args.benchdir, args.mode, args.parallel, scriptdir, args.results_dir)


if __name__ == "__main__":
    main()
