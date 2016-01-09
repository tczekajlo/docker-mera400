FROM   ubuntu:14.04


RUN	apt-get clean
RUN	apt-get update
RUN	apt-get install -y --force-yes gcc git sudo openssh-server openssh-client \
		cmake make bison flex libncurses5-dev libreadline6 libreadline6-dev

RUN 	mkdir /var/run/sshd

RUN	/usr/sbin/useradd -m -d /mera -U mera -s /bin/bash
RUN	mkdir /mera/build
ADD	./misc/build.sh /mera/build/build.sh

RUN	cd /mera/build/; /bin/bash /mera/build/build.sh

RUN 	sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN	echo mera:mera400 | chpasswd; usermod -a -G sudo mera

RUN	echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers

RUN	chown -R mera: /mera

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
