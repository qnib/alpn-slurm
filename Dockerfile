FROM qnib/alpn-base:edge

#ENV SLURM_VER=master
ENV SLURM_VER=slurm-16.05.0-0pre1 \
    MUNGE_VER=0.5.11
RUN apk update && apk upgrade && \
    apk add vim wget tar g++ make libgcrypt-dev perl
RUN mkdir -p /opt && \
    wget -qO- https://github.com/dun/munge/archive/munge-${MUNGE_VER}.tar.gz |tar xfz - -C /opt/ && \
    mv /opt/munge-munge-${MUNGE_VER} /opt/munge/ && \
    cd /opt/munge/ && \
    ./configure && \
    make && make install
RUN wget -qO /tmp/slurm.zip https://codeload.github.com/SchedMD/slurm/zip/slurm-16-05-0-0pre1 \
 && cd /opt/ && unzip /tmp/slurm.zip \  
 && rm -f /tmp/slurm.zip \
 && mv /opt/slurm-* /opt/slurm
RUN apk add unzip linux-headers
RUN cd /opt/slurm/ && \
    ./configure 
RUN cd /opt/slurm/ && \
    make && make install
#    apk del wget tar libgcrypt-dev g++& \
#    rm -rf /var/cache/apk/*
