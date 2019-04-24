# Unsetting SINGULARITY_TMPDIR to prevent clashes with GOMAP tmpdir
unset SINGULARITY_TMPDIR

# set the tmpdir to a variable that will be local to the specific node
export tmpdir="$LOCAL"

# Loading necessary modules and this would be specific to each cluster
module load mpi/gcc_mvapich singularity/2.6.0