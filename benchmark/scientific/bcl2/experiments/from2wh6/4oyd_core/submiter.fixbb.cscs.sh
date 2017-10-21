#!/bin/bash -l
#SBATCH --ntasks=288
#SBATCH --ntasks-per-node=36
#SBATCH --nodes=8
#SBATCH --ntasks-per-core=1
#SBATCH --cpus-per-task 1
#SBATCH --partition=normal
#SBATCH --constraint=mc
#SBATCH --time 05:00:00
#SBATCH --job-name="bcl2_fixbb"
#SBATCH --output=/scratch/snx1600/jbonet/logs/bcl2_fixbb.%A_%a.out
#SBATCH --error=/scratch/snx1600/jbonet/logs/bcl2_fixbb.%A_%a.err

export OMP_NUM_THREADS=1

# Define Rosetta executable (not accessible form queues)
ROSETTABIN=/project/s731/bin/Rosetta
ROSETTACOMP=mpistatic.linuxiccrelease
ROSETTAVERSION=nubinitio/main/source/bin
ROSETTAAPP=rosetta_scripts
ROSETTAEXE=${ROSETTABIN}/${ROSETTAVERSION}/${ROSETTAAPP}.${ROSETTACOMP}

# The actual executable
ROSETTAEXE=/scratch/snx1600/jbonet/bin/${ROSETTAAPP}.${ROSETTACOMP}

# Fixed number of structures: 572
NSTRUCT="-nstruct 572"

# Redirect database
ROSETTADB="-in:path:database /scratch/snx1600/"${USER}"/database"

# Naming conventions
JOBNAME=${2}
JOBTYPE="fixbb"
PREFIX=${JOBTYPE}_${JOBNAME}_${SLURM_TASK_PID}
SCRIPT=${JOBTYPE}.xml
OUTDIR=${1}"/output"

# Parser variables
ARGPARSE="-out:file:silent_struct_type binary -parser:script_vars protocol=packing"

# Trace log files
TRACER="-mpi_tracer_to_file "${OUTDIR}"/tracer_"${SLURM_TASK_PID}".log"

mkdir -p ${OUTDIR}

srun -n $SLURM_NTASKS --ntasks-per-node=$SLURM_NTASKS_PER_NODE -c $SLURM_CPUS_PER_TASK ${ROSETTAEXE} -parser:protocol ${SCRIPT} -s ${3} -out:prefix ${PREFIX}_ -out:file:silent ${OUTDIR}/${PREFIX} ${TRACER} ${NSTRUCT} ${ROSETTADB} ${ARGPARSE}
