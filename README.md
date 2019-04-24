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

The boilerplate has steps to run the annotation on Sorghum reference genome, and the input file is `Sbicolor_454_v3.1.1.protein_primaryTranscriptOnly.fa`. Files have to be customized for individual clusters

### Edit the `config.yaml` file
```
input:
  #input fasta file name
  fasta: your_input.fasta
  # output file basename
  basename: desired_output_basename
  #input NCBI taxonomy id
  taxon: "XXXXX"
  # Name of the species
  species: "You species"
  # Email is mandatory
  email: you@domain.com
  #Number of CPUs used for tools
  cpus: Find this out from the cluster help page
  #Whether mpi should be used (mpich-3.2.1  is default)
  mpi: True
  #what the name of the 
  tmpdir: "/tmpdir"
```

### Edit the `setenv.sh` file

```
# set the tmpdir to a variable that will be local to the specific node
export tmpdir="$LOCAL" # or other location based on cluster

# Loading necessary modules and this would be specific to each cluster

# Loading the mpich module. This is based on how it is called on the cluster and contact the cluster help to get the correct module to load
module load mpich

# Load the singulairy module. GOMAP-singulrity currently only works with Singulairty 2.6.
x and you have to use the correct version
module load singularity/2.6.x

#Set the location of GOMAP-singularity base directory. This is essential to correctly run the pipeline
export GOMAP_LOC="/path/to/GOMAP-singularity/"

```

### Edit the `*.job` files

Each cluster has specific parameters that need to be optimized for the sbatch files before they can be successfully run. A list of such parameters are given below.

1. --ntasks-per-node=XX
    This parameter is used by some clusters to assign entire nodes so assign the number based on the number of cores available on each compute node

2. --nodes=XX
    This parameter is used for assigning number of nodes for each job. The domain and mixmeth-blast jobs need customization based on the number of nodes you can use for parallelized jobs 

3. --partition=XX
   Some of the clusters have specific partitions that have to be used for big or parallelized jobs so find out which partition can be used for that

4. -mail-user=you@domain.com
   Assign a correct value to get job status changes to see which jobs are done.






