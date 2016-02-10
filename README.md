# alpn-slurm
Alpine QNIBTerminal w/ slurm installation (to be used in slurmd/slurmctld)


## Debug build

To help figure out what's wrong, simply checkout this repository, run the build and work your way through it...


```
$ docker build -t my/alpine-slurm .
Sending build context to Docker daemon  89.6 kB
Step 1 : FROM qnib/alpn-syslog
 ---> 303a06ef889e
*snip*
 ---> f9077e18cdad
Successfully built f9077e18cdad
$ 
```

```
$ docker run -ti my/alpine-slurm  bash
bash-4.3# cd /opt/slurm/
bash-4.3# ./configure && make && make install
```

Packages are add using `apk add`, search via `apk search`.
