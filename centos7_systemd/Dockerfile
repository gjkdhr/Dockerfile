FROM docker.io/centos:latest
MAINTAINER gjkdhr gjkdhr@163.com

#Temporarily do not understand
ENV container docker

#docker run label
LABEL RUN="docker run -t -i --name CONTAINER_NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e IMAGE=IMAGE -v /run:/run/ -v /var/log:/var/log -v /etc/localtime:/etc/localtime -v /:/host IMAGE"

#By default, the CentOS containers are built using yum's nodocs option, which helps reduce the size of the image.
#If you install a package and discover files missing, please comment out the line tsflags=nodocs
#in /etc/yum.conf and reinstall your package
RUN [ -e /etc/yum.conf ] && sed -i '/tsflages=nodocs/d' /etc/yum.conf || true

#config the centos yum origin config the 163 origin.
RUN yum install wget -y
RUN yum clean all 
RUN mkdir -pv /mnt/yum
WORKDIR /etc/yum.repos.d/
RUN mv CentOS-Base.repo /mnt/yum/
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
RUN yum clean all
RUN yum makecache

#Currently, systemd in CentOS 7 has been removed and replaced 
#with a fakesystemd package for dependency resolution.This is
#due to systemd requiring the CAP_SYS_ADMIN capability,
#as well as being able to read the host's cgroups.
#If you wish to replace the fakesystemd package and use systemd normally,
#please follow the steps below.

#Because of these systemd-container and systemd-container-libs are docker-systemd, 
#we want to replace it with systemd centos7 systemd and systemd-libs.
#Since protection when uninstalling by container
#"yum swap -- remove package -- install package" esolved to install and uninstall
RUN yum -y swap -- remove  systemd-container systemd-container-libs \
	   -- install systemd systemd-libs

#reinstall all package add the man docs	
RUN yum  reinstall -y "*"  && \
    	yum clean all

#clean out the systemd-container package and install all useful packages
RUN yum install -y \
	kernel \
        e2fsprogs \
        sos \
        crash \
        strace \
        ltrace \
        tcpdump \
        abrt \
        pcp \
        systemtap \
        perf \
        bc \
        blktrace \
        btrfs-progs \
        ethtool \
        file \
        findutils \
        gcc \
        gdb \
        git \
        glibc-common \
        glibc-utils \
        hwloc \
        iotop \
        iproute \
        iputils \
        less \
        pciutils \
        ltrace \
        mailx \
        man-db \
        nc \
        netsniff-ng \
        net-tools \
        numactl \
        numactl-devel \
        passwd \
        perf \
        procps-ng \
        psmisc \
        screen \
        strace \
        sysstat \
        systemtap-client \
        tar \
        tcpdump \
        vim-enhanced \
        xauth \
        which \
        ostree \
        rpm-ostree \
        docker \
        python-docker-py \
        docker-selinux \
        kubernetes-client \
        kubernetes-node \
        kubernetes-devel \
        kubernetes-master \
        gdb-gdbserver \
        vim-minimal \
        bash-completion \
        subscription-manager \
        python-rhsm \
        rootfiles \
        yum-utils \
RUN yum clean all

# Set default command
CMD ["/usr/bin/bash"]
