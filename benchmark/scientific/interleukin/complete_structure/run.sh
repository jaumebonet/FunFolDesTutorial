cp ../pdbs/3ink.pdb.gz .
gunzip 3ink.pdb.gz
python renumber_pdb.py -p 3ink.pdb | grep -v ANISOU | grep -E '^ATOM|^TER|^END' | grep ' C ' > 3inkC.pdb
perl getBluePrintFromCoords.pl -pdbfile 3inkC.pdb -chain C > 3inkC.blue
/Volumes/MiniOne/Projects/BonetJaume/RosettaFFL/side_changes/source/bin/remodel.macosclangrelease @remodel.flags

