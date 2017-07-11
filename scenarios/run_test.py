import os
import json
import shutil
import subprocess
import sys

cwd    = os.path.abspath(os.getcwd())
mypath = os.path.dirname(os.path.realpath(__file__))
jsontp = os.path.join(mypath, "paths.json")
jsonwk = os.path.join(mypath, "paths.json.user")

if not os.path.isfile(jsonwk):
    shutil.copyfile(jsontp, jsonwk)

justprint = len(sys.argv) > 1 and sys.argv[1] == "print"

if (justprint):
    print("Print mode only.")

paths   = json.loads("".join([x.strip() for x in open(jsonwk).readlines()]))
RS_path = paths["rosetta"]["path"]
RS_vers = paths["rosetta"]["version"]

os.chdir(os.path.abspath(mypath))
with open("run_test.log", "w") as fo:
    for testpath in paths["tests"]:
        folder = os.path.abspath(testpath.keys()[0])
        print("cd {0}".format(folder))
        os.chdir(folder)
        for test in testpath[testpath.keys()[0]]:
            try:
                command = "{0}rosetta_scripts.{1} @flags_{2} > {2}.rslog".format(RS_path, RS_vers, test)
                print(command)
                if ( not justprint ):
                    subprocess.call(command, shell=True)
                    fo.write("OK!: test {0}.{1} finished without crashing\n".format(folder, test))
            except OSError:
                fo.write("KO!: test {0}.{1} crashed somewhere\n".format(folder, test))
        print("cd {0}".format(os.path.abspath(mypath)))
        os.chdir(os.path.abspath(mypath))
os.chdir(os.path.abspath(cwd))
