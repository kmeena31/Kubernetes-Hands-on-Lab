
1. Creating a Docker file:  named Dockerfile with the following content:
```
FROM ubuntu:latest
RUN echo "Hello from my first Docker image" > /message.txt
CMD ["cat", "/message.txt"]

```
```
Output: 
Hello from my first Docker image
```

2. Inspect & debug Commands 
--------------------------
$ docker run -d \
> --name webserver -p 8080:80 \
> -e NGINX_HOST=learning.local nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
46243d3234ed: Pull complete 
6b37362b3da7: Pull complete 
f1169c633cbc: Pull complete 
3326c3817340: Pull complete 
f802f27d954b: Pull complete 
2056b40bae09: Pull complete 
afa8dec48454: Pull complete 
37d8c7707e42: Download complete 
e40088050cb6: Download complete 
Digest: sha256:abe47724e466aeab9a345d8e46a221c2fa8953c7848bb4a3bd9976a7199f8cf2
Status: Downloaded newer image for nginx:latest
43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099


2.1 Inspect command:
---------------------
$ docker inspect webserver
[
    {
        "Id": "43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099",
        "Created": "2026-10-03T14:43:27.156548604Z",
        "Path": "/docker-entrypoint.sh",
        "Args": [
            "nginx",
            "-g",
            "daemon off;"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 964,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2026-10-03T14:43:28.066923535Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:abe47724e466aeab9a345d8e46a221c2fa8953c7848bb4a3bd9976a7199f8cf2",
        "ResolvConfPath": "/var/lib/docker/containers/43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099/hostname",
        "HostsPath": "/var/lib/docker/containers/43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099/hosts",
        "LogPath": "/var/lib/docker/containers/43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099/43fd15ec25af688a8c47cc0cff213fc768aed268096fd7a50643167ddca3c099-json.log",
        "Name": "/webserver",
        "RestartCount": 0,
        "Driver": "overlayfs",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "bridge",
            "PortBindings": {
                "80/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "8080"
                    }
                ]
            },
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                12,
                50
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": null,
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/acpi",
                "/proc/asound",
                "/proc/interrupts",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/sys/devices/virtual/powercap",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "Storage": {
            "RootFS": {
                "Snapshot": {
                    "Name": "overlayfs"
                }
            }
        },
        "Mounts": [],
        "Config": {
            "Hostname": "43fd15ec25af",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "NGINX_HOST=learning.local",
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NGINX_VERSION=1.31.6",
                "NJS_VERSION=1.0.1",
                "NJS_RELEASE=1~trixie",
                "ACME_VERSION=0.4.1",
                "PKG_RELEASE=1~trixie",
                "DYNPKG_RELEASE=1~trixie"
            ],
            "Cmd": [
                "nginx",
                "-g",
                "daemon off;"
            ],
            "Image": "nginx",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "/docker-entrypoint.sh"
            ],
            "Labels": {
                "maintainer": "NGINX Docker Maintainers \u003cdocker-maint@nginx.com\u003e"
            },
            "StopSignal": "SIGQUIT"
        },
        "NetworkSettings": {
            "SandboxID": "9f37328bfd955a81bcda1e14b17c4d267a337cb677faa1f41ef2fb9ccdc1928e",
            "SandboxKey": "/var/run/docker/netns/9f37328bfd95",
            "Ports": {
                "80/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "8080"
                    },
                    {
                        "HostIp": "::",
                        "HostPort": "8080"
                    }
                ]
            },
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "DriverOpts": null,
                    "GwPriority": 0,
                    "NetworkID": "e42f445cf664fdf7ed4ca21a3e0696022c829daa8a0dc82badab67ad1e91bc6f",
                    "EndpointID": "0010b70a9d4cfe354c84cd4f15149a623bce460ea305749fc84a0ea3a8e3d7ed",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "MacAddress": "5e:ce:21:3f:a4:ff",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": null
                }
            }
        },
        "ImageManifestDescriptor": {
            "mediaType": "application/vnd.oci.image.manifest.v1+json",
            "digest": "sha256:9c0f39aa1c46f5062ba080555a067ebb82d5f63a8cf4d63f6ef2e76fc9ff2d0c",
            "size": 2290,
            "annotations": {
                "com.docker.official-images.bashbrew.arch": "amd64",
                "org.opencontainers.image.base.digest": "sha256:7792b1f7702a86946cd518db72b6a407302c3e9bc1635634368b878189e8221c",
                "org.opencontainers.image.base.name": "debian:trixie-slim",
                "org.opencontainers.image.created": "2026-09-19T00:19:58Z",
                "org.opencontainers.image.revision": "a16f1329e13e7273c4103f75d863ca625b75109e",
                "org.opencontainers.image.source": "https://github.com/nginx/docker-nginx.git#a16f1329e13e7273c4103f75d863ca625b75109e:mainline/debian",
                "org.opencontainers.image.url": "https://hub.docker.com/_/nginx",
CONTAINER ID   NAME        CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O     PIDS
43fd15ec25af   webserver   0.00%     12.04MiB / 7.599GiB   0.15%     1.17kB / 126B   0B / 12.3kB   13



2.2 Docker Top command:
---------------------------
$ docker top webserver
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                964                 940                 0                   14:43               ?                   00:00:00            nginx: master process nginx -g daemon off;
statd               1007                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1008                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1009                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1010                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1011                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1012                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1013                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1014                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1015                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1016                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1017                964                 0                   14:43               ?                   00:00:00            nginx: worker process
statd               1018                964                 0                   14:43               ?                   00:00:00            nginx: worker process

2.3 To check logs of webserver 
-------------------------------
$ docker logs -f webserver 
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/10/03 14:43:28 [notice] 1#1: using the "epoll" event method
2026/10/03 14:43:28 [notice] 1#1: nginx/1.31.6
2026/10/03 14:43:28 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
2026/10/03 14:43:28 [notice] 1#1: OS: Linux 6.18.40.1-microsoft-standard-WSL2
2026/10/03 14:43:28 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/10/03 14:43:28 [notice] 1#1: start worker processes
2026/10/03 14:43:28 [notice] 1#1: start worker process 29
2026/10/03 14:43:28 [notice] 1#1: start worker process 30
2026/10/03 14:43:28 [notice] 1#1: start worker process 31
2026/10/03 14:43:28 [notice] 1#1: start worker process 32
2026/10/03 14:43:28 [notice] 1#1: start worker process 33
2026/10/03 14:43:28 [notice] 1#1: start worker process 34
2026/10/03 14:43:28 [notice] 1#1: start worker process 35
2026/10/03 14:43:28 [notice] 1#1: start worker process 36
2026/10/03 14:43:28 [notice] 1#1: start worker process 37
2026/10/03 14:43:28 [notice] 1#1: start worker process 38
2026/10/03 14:43:28 [notice] 1#1: start worker process 39
2026/10/03 14:43:28 [notice] 1#1: start worker process 40


2.4 To check port of webserver
------------------------------
$ docker port webserver
80/tcp -> 0.0.0.0:8080
80/tcp -> [::]:8080

3. Persist data with volumes
-----------------------------
3.1 Named Volume:
$ docker run -v app-data:/var/lib/data nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/10/03 15:04:48 [notice] 1#1: using the "epoll" event method
2026/10/03 15:04:48 [notice] 1#1: nginx/1.31.6
2026/10/03 15:04:48 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
2026/10/03 15:04:48 [notice] 1#1: OS: Linux 6.18.40.1-microsoft-standard-WSL2
2026/10/03 15:04:48 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/10/03 15:04:48 [notice] 1#1: start worker processes
2026/10/03 15:04:48 [notice] 1#1: start worker process 29
2026/10/03 15:04:48 [notice] 1#1: start worker process 30
2026/10/03 15:04:48 [notice] 1#1: start worker process 31
2026/10/03 15:04:48 [notice] 1#1: start worker process 32
2026/10/03 15:04:48 [notice] 1#1: start worker process 33
2026/10/03 15:04:48 [notice] 1#1: start worker process 34
2026/10/03 15:04:48 [notice] 1#1: start worker process 35
2026/10/03 15:04:48 [notice] 1#1: start worker process 36
2026/10/03 15:04:48 [notice] 1#1: start worker process 37
2026/10/03 15:04:48 [notice] 1#1: start worker process 38
2026/10/03 15:04:48 [notice] 1#1: start worker process 39
2026/10/03 15:04:48 [notice] 1#1: start worker process 40

3.2 Bind mount
$ docker run -v $(pwd)/html:/usr/share/nginx/html nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/10/03 15:07:52 [notice] 1#1: using the "epoll" event method
2026/10/03 15:07:52 [notice] 1#1: nginx/1.31.6
2026/10/03 15:07:52 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
2026/10/03 15:07:52 [notice] 1#1: OS: Linux 6.18.40.1-microsoft-standard-WSL2
2026/10/03 15:07:52 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2026/10/03 15:07:52 [notice] 1#1: start worker processes
2026/10/03 15:07:52 [notice] 1#1: start worker process 29
2026/10/03 15:07:52 [notice] 1#1: start worker process 30
2026/10/03 15:07:52 [notice] 1#1: start worker process 31
2026/10/03 15:07:52 [notice] 1#1: start worker process 32

3.3 tmpfs mount: 
docker run --tmpfs /app/cache nginx

4. Connect containers with a network
------------------------------------
ETWORK ID     NAME      DRIVER    SCOPE
e42f445cf664   bridge    bridge    local
49cec52a3005   host      host      local
46f65e5af792   none      null      local


Creating user defined bridge network 
$ docker network create app-net
7e3023587dd2324edca2989a68dc5847c7fc99caed106a289eb810e230698296

Attach db container to app-net 
$ docker run --network app-net --name db postgres
Unable to find image 'postgres:latest' locally
latest: Pulling from library/postgres
3b0757c8de7f: Pull complete 
bba753ffc208: Pull complete 

API reaches db by container name -automatic DNS
docker run --network app-net -e DB_HOST=db --name api myapi

See connected containers and their IPs:
$ docker network inspect app-net
[
    {
        "Name": "app-net",
        "Id": "7e3023587dd2324edca2989a68dc5847c7fc99caed106a289eb810e230698296",
        "Created": "2026-10-03T15:12:23.751291609Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Options": {
            "com.docker.network.enable_ipv4": "true",
            "com.docker.network.enable_ipv6": "false"
        },
        "Labels": {},
        "Containers": {},
        "Status": {
            "IPAM": {
                "Subnets": {
                    "172.18.0.0/16": {
                        "IPsInUse": 3,
                        "DynamicIPsAvailable": 65533
                    }
                }
            }
        }
    }
]


Remove once no containers are attached:
---------------------------------------
$ docker network rm app-net
app-net