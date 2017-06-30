# One Segment, No Binder

There are three examples here; one in which the insertion segment keeps the length of the segment it substitutes in the template protein and two that change that length.

Each example has its own __XML__ file. It is recommended to run an sdiff between the files to see the key differences between them:
```bash
sdiff simple_run.xml bigger_run.xml
sdiff simple_run.xml smaller_run.xml
```   
Be aware that this scripts, as they are here, will provide _two_ __RMSD__ values: one just after the __NubInitioMover__ has finalized folding (this is used for the internal filter of the mover) and another at the end of the design process.   

## Same Size insertion (simple_run)

It should look something like this:
```
SEQUENCE       SMSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASELLSLINDMPITNDQKKLMSNDVLKLVAEVWKKLEAILADVEAWFTHHHH
STRUCTURE      LHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLL
COLDSPOT                                                                        * * * *
FLEXIBLE                                                                      **                  **
HOTSPOT                                                                       ** * * * *************
MOTIF                                                                         **********************
TEMPLATE       ***************************************************************                      *****************************
CONSTRAINTS    ***************************************************************······················*****************************
MVMP_BB        *****************************************************************                  *******************************
MVMP_CHI       ***************************************************************                      *****************************
FOLD_TREE  EDGE 74 1 -1  EDGE 74 114 -1
S[SER:NtermProteinFull]MSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASELLSLINDMPITNDQKKLMSNDVLKLVAEVWKKLEAILADVEAWFTHHHH[HIS:CtermProteinFull]
PDB file name: 3ixt.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms

0001 -- 0114    P 0001  -- 0114  |   0114 residues;    01938 atoms
                           TOTAL |   0114 residues;    01938 atoms
```  

This describes a case in which two residues at each side of the motif are allowed to change _chi_ and _bb_ angles and three selected residues inside the motif are allowed to mutate and change _chi_ angles.  
As it can be seen in the __PDBInfo__ summary, the chain of the design is kept from the motif-source PDB.

## Smaller Size insertion (bigger_run)

It should look like this:
```
SEQUENCE       SMSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASEALSKISELLSLINDMPITNDQKKLMSNDKKLASNDVLKLVAEVWKKLEAILADVEAWFTHHHH
STRUCTURE      LHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLL
COLDSPOT                                                                               * * * *
FLEXIBLE                                                                             **                  **
HOTSPOT                                                                              ** * * * *************
MOTIF                                                                                **********************
TEMPLATE       **********************************************************************                      ************************************
CONSTRAINTS    **********************************************************************······················************************************
MVMP_BB        ************************************************************************                  **************************************
MVMP_CHI       **********************************************************************                      ************************************
FOLD_TREE  EDGE 81 1 -1  EDGE 81 128 -1
S[SER:NtermProteinFull]MSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASEALSKISELLSLINDMPITNDQKKLMSNDKKLASNDVLKLVAEVWKKLEAILADVEAWFTHHHH[HIS:CtermProteinFull]
PDB file name: 3ixt.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms

0001 -- 0128    P 0001  -- 0128  |   0128 residues;    02155 atoms
                           TOTAL |   0128 residues;    02155 atoms
```
The general parameters are the same as with the previous case, but the piece extracted from the template is smaller than the inserted motif, thus resulting in a longer protein. The thing here is that, from the insertion on, the constraints have been remapped to still connect the expected residues.

Key difference between the script for this model (```biger_run.xml```) and the regular one (```simple_run.xml```) is the correct definition of the used template (selector ```<And name="chA!insert" selectors="chA,!insertion" />```) so that the right part is used to evaluate the final __RMSD__ (thus, is not key for the protocol but to obtain reliable filtering values).

## Bigger Size insertion (smaller_run)

It should look like this:
```
SEQUENCE       LEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRSELLSLINDMPITNDQKKLMSNEVWKKLEAILADVEAWFTHHHH
STRUCTURE      LHHHHHHHHHHHHHHHHHHHHHLLLLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHL
COLDSPOT                                                         * * * *
FLEXIBLE                                                       **                  **
HOTSPOT                                                        ** * * * *************
MOTIF                                                          **********************
TEMPLATE       ************************************************                      **********************
CONSTRAINTS    ************************************************······················**********************
MVMP_BB        **************************************************                  ************************
MVMP_CHI       ************************************************                      **********************
FOLD_TREE  EDGE 59 1 -1  EDGE 59 92 -1
L[LEU:NtermProteinFull]EERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRSELLSLINDMPITNDQKKLMSNEVWKKLEAILADVEAWFTH[HIS_D]HH[HIS_D]H[HIS:CtermProteinFull]
PDB file name: 3ixt.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms

0001 -- 0092    P 0001  -- 0092  |   0092 residues;    01577 atoms
                           TOTAL |   0092 residues;    01577 atoms
```
In this case, a part from modifications similar to those in ```bigger_run.xml```, the script ```smaller_run.xml``` also _cuts in the N-terminus_ of the protein to obtain a more compact design without a trailing alpha appearing over the target motif. This is done by defining the template chain not with a template selector like in previous cases but with an Index selector: ```<Index name="chA" resnums="10A-115A" />```. Because of that change in size of the template itself, new fragment files to guide the _ab initio_ had to be generated.
