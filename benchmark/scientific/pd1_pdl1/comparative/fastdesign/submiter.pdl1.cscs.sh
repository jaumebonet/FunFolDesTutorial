#!/bin/bash -l
#SBATCH --ntasks=96
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task 1
#SBATCH --time 24:00:00
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --job-name="pdl1_fastdesign_ffl_bench"
#SBATCH --output=pdl1_fastdesign_ffl_bench_%A.out
#SBATCH --error=pdl1_fastdesign_ffl_bench_%A.err

module switch PrgEnv-cray PrgEnv-intel
module load daint-gpu
export CRAYPE_LINK_TYPE=dynamic
export OMP_NUM_THREADS=1

ROSETTAPATH="/scratch/snx3000/jbonet/bin/main/source/bin/"
ROSETTADIST="mpi.linuxiccrelease"
TARGET="pdl1"
PDB="pdbs/4zqk.pdb.gz"
NSTRUCT=1000
EXPERIMENT="fastdesign"
JOBID=2
SUFFIX=${EXPERIMENT}_${JOBID}_${SLURM_TASK_PID}

srun -n $SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE -c $SLURM_CPUS_PER_TASK ${ROSETTAPATH}rosetta_scripts.${ROSETTADIST} -parser:protocol fastdesign.${TARGET}.xml @common_flags -s ${PDB} -out:nstruct ${NSTRUCT} -out:prefix ${TARGET}_ -out:suffix _${SUFFIX} -out:file:silent ${TARGET}_${SUFFIX} -mpi_tracer_to_file ./tracer_${SLURM_TASK_PID}.log

echo "DAINT: RUN FINISHED"

