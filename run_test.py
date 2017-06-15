import os
import json

paths   = json.loads("".join([x.strip() for x in open("paths.json").readlines()]))
RS_path = paths["rosetta"]["path"]
RS_vers = paths["rosetta"]["version"]
cwd     = os.path.abspath(os.getcwd())


for testpath in paths["tests"]:
    folder = testpath.keys()[0]
    print("Change to dir {0}".format(folder))
    os.chdir(folder)
    for test in testpath[folder]:
        print("{0}/rosetta_scripts.{1} @flags_{2}".format(RS_path, RS_vers, test))
    print("Go back to dir {0}".format(os.path.abspath(cwd)))
    os.chdir(os.path.abspath(cwd))
