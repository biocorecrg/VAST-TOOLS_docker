FROM biocorecrg/centos-perlbrew

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>

ARG BOWTIE_VERSION=1.2.1.1
ARG VASTTOOLS_VERSION=1.3.0

# Install bowtie 
RUN cd /usr/local; curl --fail --silent --show-error --location --remote-name https://github.com/BenLangmead/bowtie/releases/download/v$BOWTIE_VERSION/bowtie-${BOWTIE_VERSION}-linux-x86_64.zip
RUN cd /usr/local; unzip -d /usr/local bowtie-${BOWTIE_VERSION}-linux-x86_64.zip

RUN cd /usr/local; rm bowtie-${BOWTIE_VERSION}-linux-x86_64.zip

# Let's put in PATH
RUN cd /usr/local/bin; ln -s ../bowtie-${BOWTIE_VERSION}/bowtie* .

# Install R and R deps
RUN yum install epel-release -y
RUN yum install R -y

COPY deps.R /usr/local

RUN Rscript /usr/local/deps.R

# Install Vast-tools
RUN cd /usr/local; curl --fail --silent --show-error --location --remote-name https://github.com/vastgroup/vast-tools/archive/v${VASTTOOLS_VERSION}.tar.gz
RUN cd /usr/local; tar zxf v${VASTTOOLS_VERSION}.tar.gz
RUN cd /usr/local; rm v${VASTTOOLS_VERSION}.tar.gz

VOLUME /VASTDB

RUN cd /usr/local/vast-tools-${VASTTOOLS_VERSION}; ln -s /VASTDB .

RUN cd /usr/local/vast-tools-${VASTTOOLS_VERSION}; ./install.R

# Clean cache
RUN yum clean all

