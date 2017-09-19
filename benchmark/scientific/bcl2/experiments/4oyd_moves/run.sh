ROSETTAPATH="/Volumes/MiniOne/Projects/BonetJaume/RosettaFFL/side_changes/source/bin/"
ROSETTADIST="macosclangrelease"
EXE=${ROSETTAPATH}rosetta_scripts.${ROSETTADIST}

NSTRUCT="-out:nstruct 50"
FLAGS="-in:ignore_unrecognized_res -in:ignore_waters"

PDB="../../pdbs/4oyd.pdb.gz"

for EXP in classicFFL fullDesign minimize minimizeBinderAlternate
do
    ${EXE} -parser:protocol nodesign.${EXP}.xml -s ${PDB} -out:file:score_only ${EXP} ${NSTRUCT} ${FLAGS} 
done