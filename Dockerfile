FROM qnib/alpn-syslog

ENV SLURM_VER=15-08-7-1 \
    MUNGE_VER=0.5.11
RUN apk update && apk upgrade && \
    apk add vim wget tar gcc make automake
RUN wget -qO- https://github.com/dun/munge/archive/munge-${MUNGE_VER}.tar.gz |tar xfz - -C /opt/ && \
    mv /opt/munge-munge-${MUNGE_VER} /opt/munge/
RUN wget -qO- https://github.com/SchedMD/slurm/archive/slurm-${SLURM_VER}.tar.gz |tar xzf - -C /opt/ && \
    mv /opt/slurm-slurm-${SLURM_VER} /opt/slurm/
#    apk del wget tar gcc && \
#    rm -rf /var/cache/apk/*
