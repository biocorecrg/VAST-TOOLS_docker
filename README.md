# VAST-TOOLS_docker
Docker for running VAST-TOOLS


## Build image

docker build -t vasttools .


## Run image

docker run -ti -v ~/myVASTDB:/VASTDB vasttools /bin/bash

~/myVASTDB is the directory where VASTDB files are stored

