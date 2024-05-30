#!/bin/bash
#SBATCH --job-name=glassTube_Mesh
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=32G

module load OpenFOAM/v2106-foss-2021a
. ${FOAM_BASH}

rm -r pro* 0
cp -r C0.orig 0
blockMesh
surfaceFeatureExtract
snappyHexMesh -overwrite
setFields
