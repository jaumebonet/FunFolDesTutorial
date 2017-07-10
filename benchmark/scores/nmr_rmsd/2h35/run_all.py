import os
import re

experiments = [(os.path.splitext(x)[0].split("_")[1], x) for x in os.listdir(".") if re.match(r'.*_.*pdb', x)]
rscripts    = "/Volumes/MiniOne/Projects/BonetJaume/RosettaFFL/side_changes/source/bin/rosetta_scripts.macosclangrelease -parser:protocol alignment.xml -in:ignore_unrecognized_res"
command     = "{0} -s {1} -parser:script_vars template={2} align={3} -out:prefix {4} -out:file:score_only rmsd_evaluation -overwrite"
align_mode  = ["align1", "align2", "align3"]

for i in range(len(experiments)):
    queries = [x[1] for x in experiments[i+1:]]
    if len(queries) > 0:
        for ali in align_mode:
            print command.format(rscripts, " ".join(queries), experiments[i][1], ali, experiments[i][0])
            os.system(command.format(rscripts, " ".join(queries), experiments[i][1], ali, experiments[i][0]))
