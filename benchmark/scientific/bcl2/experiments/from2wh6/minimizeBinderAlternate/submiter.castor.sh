#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 4000
#SBATCH --job-name="minbinalt"
#SBATCH --time 45:00:00
#SBATCH --array=501-1000
#SBATCH --output=/scratch/bonet/logs/minbinalt.%A_%a.out
#SBATCH --error=/scratch/bonet/logs/minbinalt.%A_%a.err

ROSETTAPATH="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/"
ROSETTADIST="linuxiccrelease"
EXPCOMPLEMENT="minimizeBinderAlternate"
JOBID=1
NSTRUCT=20
ROUND=${SLURM_ARRAY_TASK_ID}
TARGET="design"
DDG="evaluate_ddg"

SUFFIX=${EXPCOMPLEMENT}_${JOBID}_${ROUND}
OUTDIR="output"
INSILENT=../fullcst/binder/nodesign_binder_1_${ROUND}
mkdir -p ${OUTDIR}

srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${TARGET}.${EXPCOMPLEMENT}.xml @common_flags -in:file:silent ${INSILENT} -in:file:silent_select_random ${NSTRUCT} -out:suffix _${SUFFIX} -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}
srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${DDG}.binder.xml @common_flags -in:file:silent ${OUTDIR}/${TARGET}_${SUFFIX} -in:file:silent_struct_type binary -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}_${DDG}

echo "CASTOR: RUN FINISHED"
