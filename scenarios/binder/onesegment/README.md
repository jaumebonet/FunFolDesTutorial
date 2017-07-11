# One Segment, Binder

There are three examples here; one in which the insertion segment keeps the length of the segment it substitutes in the template protein and two that change that length.

Each example has its own __XML__ file. It is recommended to run an sdiff between the files to see the key differences between them:
```bash
sdiff simple_run.xml bigger_run.xml
sdiff simple_run.xml smaller_run.xml
```   
Be aware that this scripts, as they are here, will provide _three_ __RMSD__ values: one just after the __NubInitioMover__ has finalized folding (this is used for the internal filter of the mover), another at the end of the design process that describes how much the final design matches with the starting template and a third one that describes the difference (drift) between the structure just after __NubInitioMover__ and the final design.   

## Same Size insertion (simple_run)

It should look something like this:
```
SEQUENCE       SMSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASELLSLINDMPITNDQKKLMSNDVLKLVAEVWKKLEAILADVEAWFTHHHHDIQMTQSPSTLSASVGDRVTITCSASSRVGYMHWYQQKPGKAPKLLIYDTSKLASGVPSRFSGSGSGTEFTLTISSLQPDDFATYYCFQGSGYPFTFGGGTKVEIKRQVTLRESGPALVKPTQTLTLTCTFSGFSLSTAGMSVGWIRQPPGKALEWLADIWWDDKKHYNPSLKDRLTISKDTSKNQVVLKVTNMDPADTATYYCARDMIFNFYFDVWGQGTTVTV
STRUCTURE      LHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLEEEELLEEEEELLLLEEEEEEEEEEELLLEEEEELLLLLLEEEEELLLEELLLLLLLEEEEEEEEEEEEEELLLLHHHLEEEEEEELLLLLLEELLLEEEEEELLLEEEEELLLELLLLLLEEEEEEEELLLLLLLLEEEEEEEELLLLLLEEEEEEELLLLEEELHHHLLLEEEEEELLLLEEEEEELLLLHHHLEEEEEEEEELLEEEEEEELLLEEEEL
COLDSPOT       ·································································*·*·*·*···········································································································································································································································································
CONTEXT        ··················································································································*********************************************************************************************************************************************************************************************************************************
FLEXIBLE       ·······························································**··················**······························································································································································································································································
HOTSPOT        ·······························································**·*·*·*·*************······························································································································································································································································
MOTIF          ·······························································**********************······························································································································································································································································
TEMPLATE       ***************************************************************······················*****************************·································································································································································································································
CONSTRAINTS    ***************************************************************······················*****************************·································································································································································································································
FOLDTREE       *************************************************************************1/2***************************************C1*********************************************************************************************************C2********************************************************************************************************************C

S[SER:NtermProteinFull]MSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASELLSLINDMPITNDQKKLMSNDVLKLVAEVWKKLEAILADVEAWFTHHH[HIS_D]H[HIS:CtermProteinFull]
D[ASP:NtermProteinFull]IQMTQSPSTLSASVGDRVTITC[CYS:disulfide]SASSRVGYMHWYQQKPGKAPKLLIYDTSKLASGVPSRFSGSGSGTEFTLTISSLQPDDFATYYC[CYS:disulfide]FQGSGYPFTFGGGTKVEIKR[ARG:CtermProteinFull]
Q[GLN:NtermProteinFull]VTLRESGPALVKPTQTLTLTC[CYS:disulfide]TFSGFSLSTAGMSVGWIRQPPGKALEWLADIWWDDKKHYNPSLKDRLTISKDTSKNQVVLKVTNMDPADTATYYC[CYS:disulfide]ARDMIFNFYFDVWGQGTTVTV[VAL:CtermProteinFull]
PDB file name: 3ixt.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms
0001 -- 0114    P 0001  -- 0114  |   0114 residues;    01938 atoms
0115 -- 0221    L 0001  -- 0107  |   0107 residues;    01607 atoms
0222 -- 0339    H 0001  -- 0118  |   0118 residues;    01863 atoms
                           TOTAL |   0339 residues;    05408 atoms
```  

This describes a case in which two residues at each side of the motif are allowed to change _chi_ and _bb_ angles and three selected residues inside the motif are allowed to mutate and change _chi_ angles.  
As it can be seen in the __PDBInfo__ summary, the chain of the design is kept from the motif-source PDB.

## Bigger Size insertion (bigger_run)

It should look like this:
```
SEQUENCE       SMSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRRAVRNYASEALSKISELLSLINDMPITNDQKKLMSNDKKLASNDVLKLVAEVWKKLEAILADVEAWFTHHHHDIQMTQSPSTLSASVGDRVTITCSASSRVGYMHWYQQKPGKAPKLLIYDTSKLASGVPSRFSGSGSGTEFTLTISSLQPDDFATYYCFQGSGYPFTFGGGTKVEIKRQVTLRESGPALVKPTQTLTLTCTFSGFSLSTAGMSVGWIRQPPGKALEWLADIWWDDKKHYNPSLKDRLTISKDTSKNQVVLKVTNMDPADTATYYCARDMIFNFYFDVWGQGTTVTV
STRUCTURE      LHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLEEEELLEEEEELLLLEEEEEEEEEEELLLEEEEELLLLLLEEEEELLLEELLLLLLLEEEEEEEEEEEEEELLLLHHHLEEEEEEELLLLLLEELLLEEEEEELLLEEEEELLLELLLLLLEEEEEEEELLLLLLLLEEEEEEEELLLLLLEEEEEEELLLLEEELHHHLLLEEEEEELLLLEEEEEELLLLHHHLEEEEEEEEELLEEEEEEELLLEEEEL
COLDSPOT       ········································································*·*·*·*··················································································································································································································································································
CONTEXT        ································································································································*********************************************************************************************************************************************************************************************************************************
FLEXIBLE       ······································································**··················**·····································································································································································································································································
HOTSPOT        ······································································**·*·*·*·*************·····································································································································································································································································
MOTIF          ······································································**********************·····································································································································································································································································
TEMPLATE       **********************************************************************······················************************************·································································································································································································································
CONSTRAINTS    **********************************************************************······················************************************·································································································································································································································
FOLDTREE       ********************************************************************************1/2**********************************************C1*********************************************************************************************************C2********************************************************************************************************************C

 S[SER:NtermProteinFull]MSDIRKDLEERFDKLVEALKNKVDKMKAAFRMDQFH[HIS_D]EERMKDWFKDLRKEVEQMRRAVRNYASEALSKISELLSLINDMPITNDQKKLMSNDKKLASNDVLKLVAEVWKKLEAILADVEAWFTH[HIS_D]HH[HIS_D]H[HIS:CtermProteinFull]
 D[ASP:NtermProteinFull]IQMTQSPSTLSASVGDRVTITC[CYS:disulfide]SASSRVGYMHWYQQKPGKAPKLLIYDTSKLASGVPSRFSGSGSGTEFTLTISSLQPDDFATYYC[CYS:disulfide]FQGSGYPFTFGGGTKVEIKR[ARG:CtermProteinFull]
 Q[GLN:NtermProteinFull]VTLRESGPALVKPTQTLTLTC[CYS:disulfide]TFSGFSLSTAGMSVGWIRQPPGKALEWLADIWWDDKKHYNPSLKDRLTISKDTSKNQVVLKVTNMDPADTATYYC[CYS:disulfide]ARDMIFNFYFDVWGQGTTVTV[VAL:CtermProteinFull]
PDB file name: 3ixt.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms
0001 -- 0128    P 0001  -- 0128  |   0128 residues;    02155 atoms
0129 -- 0235    L 0001  -- 0107  |   0107 residues;    01607 atoms
0236 -- 0353    H 0001  -- 0118  |   0118 residues;    01863 atoms
                           TOTAL |   0353 residues;    05625 atoms
```
The general parameters are the same as with the previous case, but the piece extracted from the template is smaller than the inserted motif, thus resulting in a longer protein. The thing here is that, from the insertion on, the constraints have been remapped to still connect the expected residues.

Key difference between the script for this model (```biger_run.xml```) and the regular one (```simple_run.xml```) is the correct definition of the used template (selector ```<And name="templateChain!insert" selectors="templateChain,!insertion" />```) so that the right part is used to evaluate the final __RMSD__ (thus, is not key for the protocol but to obtain reliable filtering values).

## Smaller Size insertion (smaller_run)

It should look like this:
```
SEQUENCE       LEERFDKLVEALKNKVDKMKAAFRMDQFHEERMKDWFKDLRKEVEQMRSELLSLINDMPITNDQKKLMSNEVWKKLEAILADVEAWFTHHHHDIQMTQSPSTLSASVGDRVTITCSASSRVGYMHWYQQKPGKAPKLLIYDTSKLASGVPSRFSGSGSGTEFTLTISSLQPDDFATYYCFQGSGYPFTFGGGTKVEIKRQVTLRESGPALVKPTQTLTLTCTFSGFSLSTAGMSVGWIRQPPGKALEWLADIWWDDKKHYNPSLKDRLTISKDTSKNQVVLKVTNMDPADTATYYCARDMIFNFYFDVWGQGTTVTV
STRUCTURE      LHHHHHHHHHHHHHHHHHHHHHLLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHLLLLEEEELLEEEEELLLLEEEEEEEEEEELLLEEEEELLLLLLEEEEELLLEELLLLLLLEEEEEEEEEEEEEELLLLHHHLEEEEEEELLLLLLEELLLEEEEEELLLEEEEELLLELLLLLLEEEEEEEELLLLLLLLEEEEEEEELLLLLLEEEEEEELLLLEEELHHHLLLEEEEEELLLLEEEEEELLLLHHHLEEEEEEEEELLEEEEEEELLLEEEEL
COLDSPOT       ··················································*·*·*·*····································································································································································································································································
CONTEXT        ····························································································*********************************************************************************************************************************************************************************************************************************
FLEXIBLE       ················································**··················**·······················································································································································································································································
HOTSPOT        ················································**·*·*·*·*************·······················································································································································································································································
MOTIF          ················································**********************·······················································································································································································································································
TEMPLATE       ************************************************······················**********************·································································································································································································································
CONSTRAINTS    ************************************************······················**********************·································································································································································································································
FOLDTREE       **********************************************************1/2********************************C1*********************************************************************************************************C2********************************************************************************************************************C

 L[LEU:NtermProteinFull]EERFDKLVEALKNKVDKMKAAFRMDQFH[HIS_D]EERMKDWFKDLRKEVEQMRSELLSLINDMPITNDQKKLMSNEVWKKLEAILADVEAWFTHH[HIS_D]H[HIS_D]H[HIS:CtermProteinFull]
 D[ASP:NtermProteinFull]IQMTQSPSTLSASVGDRVTITC[CYS:disulfide]SASSRVGYMHWYQQKPGKAPKLLIYDTSKLASGVPSRFSGSGSGTEFTLTISSLQPDDFATYYC[CYS:disulfide]FQGSGYPFTFGGGTKVEIKR[ARG:CtermProteinFull]
 Q[GLN:NtermProteinFull]VTLRESGPALVKPTQTLTLTC[CYS:disulfide]TFSGFSLSTAGMSVGWIRQPPGKALEWLADIWWDDKKHYNPSLKDRLTISKDTSKNQVVLKVTNMDPADTATYYC[CYS:disulfide]ARDMIFNFYFDVWGQGTTVTV[VAL:CtermProteinFull]
PDB file name: 3ixt.pdb.gz
 Pose Range  Chain    PDB Range  |   #Residues         #Atoms
0001 -- 0092    P 0001  -- 0092  |   0092 residues;    01577 atoms
0093 -- 0199    L 0001  -- 0107  |   0107 residues;    01607 atoms
0200 -- 0317    H 0001  -- 0118  |   0118 residues;    01863 atoms
                           TOTAL |   0317 residues;    05047 atoms```
In this case, a part from modifications similar to those in ```bigger_run.xml```, the script ```smaller_run.xml``` also _cuts in the N-terminus_ of the protein to obtain a more compact design without a trailing alpha appearing over the target motif. This is done by defining the template chain not with a template selector like in previous cases but with an Index selector: ```<Index name="templateChain" resnums="10A-115A" />```. Because of that change in size of the template itself, new fragment files to guide the _ab initio_ had to be generated.
