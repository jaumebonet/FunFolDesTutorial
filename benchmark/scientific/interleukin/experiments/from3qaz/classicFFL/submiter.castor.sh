#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 4000
#SBATCH --job-name="il2classicFFL"
#SBATCH --time 45:00:00
#SBATCH --array=1-1000
#SBATCH --output=/scratch/bonet/logs/il2classicFFL.%A_%a.out
#SBATCH --error=/scratch/bonet/logs/il2classicFFL.%A_%a.err

ROSETTAPATH="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/"
ROSETTADIST="linuxiccrelease"
EXPCOMPLEMENT="classicFFL"
JOBID=1
ROUND=${SLURM_ARRAY_TASK_ID}
TARGET="design"
DDG="evaluate_ddg"

WITHBINDER="nobinder"
if [ ${SLURM_ARRAY_TASK_ID} -gt 500 ]; then
    WITHBINDER="binder"
fi

SUFFIX=${EXPCOMPLEMENT}_${JOBID}_${ROUND}
OUTDIR=${WITHBINDER}
INSILENT=../nodesign/${WITHBINDER}/il2_${WITHBINDER}_1_${ROUND}
mkdir -p ${OUTDIR}

srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${TARGET}.${EXPCOMPLEMENT}.xml @common_flags -in:file:silent ${INSILENT} -out:suffix _${SUFFIX} -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}
srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${DDG}.${WITHBINDER}.xml @common_flags -in:file:silent ${OUTDIR}/${TARGET}_${SUFFIX} -in:file:silent_struct_type binary -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}_${DDG}
echo "CASTOR: RUN FINISHED"
