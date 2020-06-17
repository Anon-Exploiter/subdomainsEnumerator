FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="${PATH}:/root/bins/"

RUN apt-get update -y
RUN apt-get install -y git wget python3 python3-pip python3-venv unzip

WORKDIR /root/

RUN git clone https://github.com/aboul3la/Sublist3r && \
	mkdir /root/Sublist3r/env && \
	python3 -m venv /root/Sublist3r/env/ && \
	/bin/bash -c "source /root/Sublist3r/env/bin/activate && pip install -r /root/Sublist3r/requirements.txt" && \
	rm -rfv /root/Sublist3r/.git/

RUN git clone https://github.com/shmilylty/OneForAll && \
	mkdir /root/OneForAll/env && \
	python3 -m venv /root/OneForAll/env/ && \
	/bin/bash -c "source /root/OneForAll/env/bin/activate && pip install -r /root/OneForAll/requirements.txt" && \
	rm -rfv /root/OneForAll/.git/

RUN git clone https://github.com/blechschmidt/massdns && \
	cd massdns && make && \
	rm -rfv /root/massdns/.git/

RUN mkdir bins && cd bins && \
	wget https://github.com/projectdiscovery/subfinder/releases/download/2.3.5/subfinder_2.3.5_linux_386.tar.gz && \
	wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz && \
	wget https://github.com/OWASP/Amass/releases/download/v3.7.2/amass_linux_amd64.zip && \
	wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux

RUN cd bins && \
	tar -xvf subfinder_2.3.5_linux_386.tar.gz && \
	tar -xvf assetfinder-linux-amd64-0.1.0.tgz && \
	unzip amass_linux_amd64.zip && \
	chmod +x findomain-linux

RUN cd bins && \
	rm -rfv LICENSE README.md && \
	rm -rfv *.tgz *.zip *.tar.gz && \
	mv amass_linux_amd64/amass . && \
	rm -rfv amass_linux_amd64 && \
	strip *

RUN mkdir results && \
	wget https://raw.githubusercontent.com/Anon-Exploiter/subdomainsEnumerator/master/automateSubdEnum.sh

RUN apt-get purge -y wget git && \
	apt-get autoremove -y

CMD ["/bin/bash", "-c", "/bin/bash automateSubdEnum.sh"]