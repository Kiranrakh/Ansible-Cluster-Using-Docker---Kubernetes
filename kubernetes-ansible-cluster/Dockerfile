FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server sudo python3 python3-pip software-properties-common vim sshpass && \
    add-apt-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible && \
    useradd -m ansible && echo "ansible:ansible" | chpasswd && \
    echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir /home/ansible/.ssh && \
    chown -R ansible:ansible /home/ansible/.ssh && \
    chmod 700 /home/ansible/.ssh && \
    mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]