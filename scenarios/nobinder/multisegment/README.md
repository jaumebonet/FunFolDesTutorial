# Multiple Segments, No Binder

There are three examples here; depending on the position of the two CYS that form a disulfide (CYD).

Each example has its own __XML__ file that differ in the selectors for the insertion segments:

Be aware that this scripts, as they are here, will provide _three_ __RMSD__ values: one just after the __NubInitioMover__ has finalized folding (this is used for the internal filter of the mover), another at the end of the design process that describes how much the final design matches with the starting template and a third one that describes the difference (drift) between the structure just after __NubInitioMover__ and the final design.   

## Mixed CYD (mixCYD_run)

In this scenario, one of the disulfide is on the template while the other is in one of the motif segments.  
It should look something like this:
```
SEQUENCE       AFTVTVPKDLYVVEYGSNMTIECKFPVEKQLDLAALIVYWEMEDKNIIQFVHGEEDLKVQHSSYRQRARLLKDQLSLGNAALQITDVKLQDAGVYRCMISYGGADYKRITVKVNA
STRUCTURE      LLLLLLLLLLLLLLLLLLLLLLEELLHHHHLLHHHLEEEEEEELEEEEEEELLEELLLLLLHHHLLLEEELHHHLLLLEELEEELLLLHHHLEEEEEEEELLLEELLEEEELLLL
DISULFIDIZE    ······················*·········································································*··················
FLEXIBLE       ·······································**···**·····································································
HOTSPOT        ····································*****···*******···········································****·······****······
MOTIF          ····································*****···*******···········································****·······****······
TEMPLATE       ************************************·····***·······*******************************************····*******····******
CONSTRAINTS    ************************************·····***·······*******************************************····*******····******
FOLDTREE       *************************************1/2/3****C***1**********C*************************************2****C*****3*******C

A[ALA:NtermProteinFull]FTVTVPKDLYVVEYGSNMTIEC[CYS:disulfide]KFPVEKQLDLAALIVYWEME[GLU:protein_cutpoint_lower]
D[ASP:protein_cutpoint_upper]KNIIQFVH[HIS_D]GEEDLK[LYS:protein_cutpoint_lower]
V[VAL:protein_cutpoint_upper]QH[HIS_D]SSYRQRARLLKDQLSLGNAALQITDVKLQDAGVYRC[CYS:disulfide]MISY[TYR:protein_cutpoint_lower]
G[GLY:protein_cutpoint_upper]GADYKRITVKVNA[ALA:CtermProteinFull]

PDB file name: 4zqk.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms
0001 -- 0115    A 0001  -- 0115  |   0115 residues;    01863 atoms
                           TOTAL |   0115 residues;    01863 atoms
```  

This describes a case in which two residues at each side of the first and second segments of the motif are allowed to change _chi_ and _bb_ angles.  
As it can be seen in the __PDBInfo__ summary, the chain of the design is kept from the motif-source PDB.  
As of now, the disulfide is guaranteed as long as the inserted segment of the motif contains a disulfide in the same region as the extracted
segment from the template (this could be also guaranteed by previously mutating the motif segment to fulfill that condition).
