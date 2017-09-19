ROSETTAPATH="/Volumes/MiniOne/Projects/BonetJaume/RosettaFFL/side_changes/source/bin/"
ROSETTADIST="macosclangrelease"

${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol 3lhp_vs_4oyd_alignment.xml -s ../../pdbs/3lhp.pdb.gz -out:file:score_only 3lhp_vs_4oyd -in:ignore_unrecognized_res
