#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 4000
#SBATCH --job-name="il2nodesign"
#SBATCH --time 45:00:00
#SBATCH --array=1-1000
#SBATCH --output=/scratch/bonet/logs/il2nodesign.%A_%a.out
#SBATCH --error=/scratch/bonet/logs/il2nodesign.%A_%a.err

ROSETTAPATH="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/"
ROSETTADIST="linuxiccrelease"
EXPCOMPLEMENT="nobinder"
JOBID=1
NSTRUCT=40
ROUND=${SLURM_ARRAY_TASK_ID}

TARGET="il2"
PDB="../../../complete_structure/3inkC_03.pdb"

if [ ${SLURM_ARRAY_TASK_ID} -gt 500 ]; then
    EXPCOMPLEMENT="binder"
fi

SUFFIX=${EXPCOMPLEMENT}_${JOBID}_${ROUND}
OUTDIR=$(echo ${EXPCOMPLEMENT})
mkdir -p ${OUTDIR}
srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${TARGET}.${EXPCOMPLEMENT}.xml @common_flags -s ${PDB} -out:nstruct ${NSTRUCT} -out:prefix ${TARGET}_ -out:suffix _${SUFFIX} -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}

echo "CASTOR: RUN FINISHED"
