#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8000
#SBATCH --job-name="classicFFL"
#SBATCH --time 45:00:00
#SBATCH --array=1-1000

## ROSETTA VERSION
ROSETTAPATH="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/"
ROSETTADIST="linuxiccrelease"
ROSETTAEXE=${ROSETTAPATH}rosetta_scripts.${ROSETTADIST}

## SLURM ARRAY COUNT
ROUND=$(printf "%03d" ${SLURM_ARRAY_TASK_ID})

## JOB PROPERTIES
PDB_ID="pdbs/4zqk3_0001.pdb"
NSTRUCT=20
JOB_TYPE="pd1"
RD_PROTOCOL="nodesign"
SCRIPT=${JOB_TYPE}.${RD_PROTOCOL}.xml

## OUTPUT NAMING
PREFIX="pd1"
SUFFIX=${RD_PROTOCOL}_${ROUND}
OUTDIR="binder"

## COMMANDS
mkdir -p ${OUTDIR}
srun ${ROSETTAEXE} -parser:protocol ${SCRIPT} @common_flags -s ${PDB_ID} -out:prefix ${PREFIX}_ -out:suffix _${SUFFIX} -out:file:silent ${OUTDIR}/${JOB_TYPE}_${SUFFIX}

echo "CASTOR: RUN FINISHED"
