#!/bin/sh -l

#SBATCH --time=3-13:00:00

#SBATCH --qos=slight
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
##SBATCH --account=community
#SBATCH --mem-per-cpu=32000
#SBATCH --partition=std
#SBATCH --nodelist=cn005
#SBATCH --mail-user=jacob.abdelfatah@ulpgc.es
#SBATCH --mail-type=ALL

#. /usr/local/lib/slurm/infoJob.sh

echo "************************************************************"
echo "          FreeFem++ executed on $SLURMD_NODENAME"
echo "************************************************************"



echo "\n"
echo "###############################################################################"
echo "Job started at: `date`"
echo "###############################################################################"

rm  *.vtk *.txt *.vtu
find . -name "*.out" -type f -not -newermt "$(squeue --job $SLURM_JOB_ID --format=%S | grep -v START_TIME)" -delete



FreeFem++ -nw Layton_test.edp

#pwd
#n_proc=$1
#echo "Proceso nº $n_proc"

echo "\n"
echo "###############################################################################"
echo "Job ended at: `date`"
echo "###############################################################################"

