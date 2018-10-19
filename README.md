# VAST-TOOLS in Docker
Docker for running [VAST-TOOLS](https://github.com/vastgroup/vast-tools)


## Build image

    docker build -t biocorecrg/vast-tools .

Build arguments are provided for VAST-TOOLS and BOWTIE

## Run image

    docker run -d -v ~/myVASTDB:/VASTDB -v ~/myshared:/share --name myvast biocorecrg/vast-tools tail -f /dev/null

~/myVASTDB is the directory where VASTDB files are stored

~/myshared is a shared volume used for convenience for placing input and output files

The command above keeps container running under the name myvast

Example running command:

    cd ~/myshared
    fastq-dump SRR7802623
    docker exec myvast biocorecrg/vast-tools align /share/reads/SRR7802623.fastq -sp Hsa --expr -o /share/out/test

## Converting to Singularity

    docker run -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/test:/output --privileged -t --rm singularityware/docker2singularity biocorecrg/vast-tools
