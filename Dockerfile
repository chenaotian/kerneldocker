FROM ubuntu:20.04

WORKDIR /root

LABEL maintainer="chenaotian <breezecat@qq.com>"

COPY ./rootfs /root/tools/
COPY ./boot.sh /root/tools/
COPY ./usefulcmd.txt /root/tools/

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai

RUN echo root:root|chpasswd
RUN apt-get update && \
    apt-get install -y gcc \
    make \
    flex \
    bison \
    bc \
    libelf-dev \
    libssl-dev \
    fakeroot \
    vim \
    unzip \
    git \
    gdb \
    python3 \
    qemu-system-x86\
    grep-dctrl \
    kernel-wedge \
    dwarves zstd \
    openssh-server \
    clangd \
    bear \
    libncurses5-dev \
    cpio

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config



EXPOSE 22
CMD ["service", "ssh", "start"]
