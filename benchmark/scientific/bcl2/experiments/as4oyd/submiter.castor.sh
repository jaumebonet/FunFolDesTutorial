#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 4000
#SBATCH --job-name="as4oyd"
#SBATCH --time 15:00:00
#SBATCH --array=1-1000
#SBATCH --output=/scratch/bonet/logs/as4oyd.%A_%a.out
#SBATCH --error=/scratch/bonet/logs/as4oyd.%A_%a.err

ROSETTAPATH="/scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/"
ROSETTADIST="linuxiccrelease"
EXPCOMPLEMENT="nobinder"
JOBID=1
NSTRUCT=10
ROUND=printf "%04d" ${SLURM_ARRAY_TASK_ID}

TARGET="as4oyd"
DDG="evaluate_ddg"
PDB="../../pdbs/4oyd.pdb.gz"

if [ ${SLURM_ARRAY_TASK_ID} -gt 500 ]; then
    EXPCOMPLEMENT="binder"
fi

SUFFIX=${EXPCOMPLEMENT}_${JOBID}_${ROUND}
OUTDIR=$(echo ${EXPCOMPLEMENT})
mkdir -p ${OUTDIR}
srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${TARGET}.${EXPCOMPLEMENT}.xml @common_flags -s ${PDB} -out:nstruct ${NSTRUCT} -out:prefix ${TARGET}_ -out:suffix _${SUFFIX} -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}
srun ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol ${DDG}.${EXPCOMPLEMENT}.xml @common_flags -in:file:silent ${OUTDIR}/${TARGET}_${SUFFIX} -in:file:silent_struct_type binary -out:nstruct ${NSTRUCT} -out:file:silent ${OUTDIR}/${TARGET}_${SUFFIX}_${DDG}
echo "CASTOR: RUN FINISHED"
