FROM   ubuntu:14.04


RUN	apt-get clean
RUN	apt-get update
RUN	apt-get install -y --force-yes gcc git sudo openssh-server openssh-client \
		cmake make bison flex libncurses5-dev libreadline6 libreadline6-dev \
		telnet unzip

RUN 	mkdir /var/run/sshd

RUN	/usr/sbin/useradd -m -d /mera -U mera -s /bin/bash
RUN	mkdir /mera/build
ADD	./misc/build.sh /mera/build/build.sh

RUN	cd /mera/build/; /bin/bash /mera/build/build.sh

RUN	cd /mera; wget http://mera400.pl/img/bootw.bin; wget http://mera400.pl/img/crook5-p8f-1.0.3.zip
RUN	cd /mera; unzip crook5-p8f-1.0.3.zip; rm crook5-p8f-1.0.3.zip

RUN 	sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN	echo mera:mera400 | chpasswd; usermod -a -G sudo mera

RUN	echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers

RUN	chown -R mera: /mera

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
