# GOMAP-singularity Boilerplate

The **GOMAP-singularity Boilerplate** repo has been distributed for the use with [GOMAP-singularity](https://github.com/Dill-PICL/GOMAP-singularity) to annotate GO terms to plant genes on SLURM high-performance computing environments.

## Obtaining the boilerplate
git clone https://github.com/Dill-PICL/GOMAP-boilerplate.git /path/for/annotation

## GOMAP-singularity steps

GOMAP-singularity has seven steps for annotating the proteins. Some of these steps are parallelized and some of them are not parallelized.

| Number | Step            | Single | MPI | Concurrent |
| ------ | --------------- | ------ | --- | ---------- |
| 1      | seqsim          | Y      | N   | Y          |
| 2      | domain          | Y      | Y   | Y          |
| 3      | fanngo          | Y      | N   | Y          |
| 4      | mixmeth-blast   | Y      | Y   | Y          |
| 5      | mixmeth-preproc | Y      | N   | N          |
| 6      | mixmeth         | Y      | N   | N          |
| 7      | aggregate       | Y      | N   | N          |


## Customizing files for the cluster

The boilerplate has steps to run the annotation on Sorghum reference genome, and the input file is `Sbicolor_454_v3.1.1.protein_primaryTranscriptOnly.fa`. Files have to be customized for 

