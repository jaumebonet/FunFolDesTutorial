#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 4000
#SBATCH --time 15:00:00
#SBATCH --array=1-500
#SBATCH --output=/scratch/bonet/logs/constraintbench.%A_%a.out
#SBATCH --error=/scratch/bonet/logs/constraintbench.%A_%a.err

CSTWEIGTH=0
experiment=constraintbench

if [ ${SLURM_ARRAY_TASK_ID} -gt 100 ]; then
    CSTWEIGTH=0.5
fi
if [ ${SLURM_ARRAY_TASK_ID} -gt 200 ]; then
    CSTWEIGTH=1.0
fi
if [ ${SLURM_ARRAY_TASK_ID} -gt 300 ]; then
    CSTWEIGTH=1.5
fi
if [ ${SLURM_ARRAY_TASK_ID} -gt 400 ]; then
    CSTWEIGTH=2.0
fi

srun /scratch/lpdi/bin/Rosetta/devel/nubinitio/main/source/bin/rosetta_scripts.linuxiccrelease @nubinitio_flags -out:suffix _${experiment}_${CSTWEIGTH}_${SLURM_ARRAY_TASK_ID} -out:file:silent ${experiment}_${CSTWEIGTH}_${SLURM_ARRAY_TASK_ID} -parser:script_vars cstweight=${CSTWEIGTH} 
echo "CASTOR: RUN FINISHED"

