# VAST-TOOLS in Docker
Docker for running [VAST-TOOLS](https://github.com/vastgroup/vast-tools)


## Build image

    docker build -t vasttools .

Build arguments are provided for VAST-TOOLS and BOWTIE

## Run image

    docker run -d -v ~/myVASTDB:/VASTDB -v ~/myshared:/share --name myvast vasttools tail -f /dev/null

~/myVASTDB is the directory where VASTDB files are stored

~/myshared is a shared volume used for convenience for placing input and output files

The command above keeps container running under the name myvast

Example running command:

    docker exec myvast  vast-tools align /share/reads/SRR493366.fastq -sp Hsa --expr -o /share/out/test

