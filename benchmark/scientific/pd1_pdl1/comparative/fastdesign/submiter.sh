#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8000
#SBATCH --job-name="fastdesign_ffl_bench"
#SBATCH --time 35:00:00
#SBATCH --array=1-700
#SBATCH --output=/scratch/bonet/logs/ffl_fastdesign.%A_%a.out
#SBATCH --error=/scratch/bonet/logs/ffl_fastdesign.%A_%a.err

ROSETTAPATH="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/"
ROSETTADIST="linuxiccrelease"
EXPERIMENT="fastdesign"
JOBID=2
NSTRUCT=30
ROUND=printf "%03d" ${SLURM_ARRAY_TASK_ID}

TARGET="pd1"
PDB="pdbs/4zqk3_0001.pdb"

if [ ${SLURM_ARRAY_TASK_ID} -gt 350 ]; then
    TARGET="pdl1"
    PDB="pdbs/4zqk.pdb.gz"
fi

SUFFIX=${EXPERIMENT}_${JOBID}_${ROUND}

srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol fastdesign.${TARGET}.xml @common_flags -s ${PDB} -out:nstruct ${NSTRUCT} -out:prefix ${TARGET}_ -out:suffix _${SUFFIX} -out:file:silent ${TARGET}_${SUFFIX}
echo "CASTOR: RUN FINISHED"
