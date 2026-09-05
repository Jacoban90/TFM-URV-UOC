#!/bin/bash -l
#SBATCH --job-name=layton_l1
#SBATCH --time=1-00:00:00
#SBATCH --qos=slight
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=32000
#SBATCH --partition=std
#SBATCH --nodelist=cn005
#SBATCH --mail-user=jacob.abdelfatah@ulpgc.es
#SBATCH --mail-type=ALL
#SBATCH --output=layton_level1_%j.out
#SBATCH --error=layton_level1_%j.err

set -euo pipefail
cd "${SLURM_SUBMIT_DIR}"

echo "============================================================"
echo "Layton level 1 bibloque"
echo "Nodo: ${SLURMD_NODENAME}"
echo "Inicio: $(date)"
echo "Directorio: ${SLURM_SUBMIT_DIR}"
echo "============================================================"

# Elimina solo resultados de una ejecucion anterior de este mismo caso.
rm -f level1_2blocks_t0.vtu level1_2blocks_t10.vtu \
      level1_2blocks_t20.vtu level1_2blocks_t30.vtu \
      level1_2blocks_t40.vtu

export OMP_NUM_THREADS=1
FreeFem++ -nw Layton_test_level1_2blocks.edp | tee layton_level1_run.log

echo "============================================================"
echo "Fin: $(date)"
echo "============================================================"
