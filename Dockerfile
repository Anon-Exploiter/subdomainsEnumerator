FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="${PATH}:/root/bins/"

RUN apt-get update -y
RUN apt-get install -y git wget python3 python3-pip unzip

WORKDIR /root/

RUN mkdir /root/Sublist3r && cd /root/Sublist3r && \
	wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/sublist3r.py -O sub.py && \
	cat sub.py | sed 's/from subbrute import subbrute//i' > sublist3r.py && \
	pip3 install argparse dnspython requests idna && \
	rm -rfv requirements.txt && rm -rfv sub.py

RUN mkdir OneForAll && cd OneForAll && \
	wget https://github.com/shmilylty/OneForAll/archive/v0.3.0.tar.gz && \
	tar -xvf v0.3.0.tar.gz && \
	rm -rfv v0.3.0.tar.gz && \
	mv OneForAll-0.3.0/* . && rm -rfv OneForAll-0.3.0 && \
	rm -rfv thirdparty/ && \
	cd data && \
	ls | grep -v public_suffix_list.dat | grep -v srv_prefixes.json | xargs rm -rfv && \
	pip3 install -r /root/OneForAll/requirements.txt

RUN mkdir massdns && cd massdns && \
	wget https://github.com/blechschmidt/massdns/archive/v0.3.tar.gz && \
	tar -xvf v0.3.tar.gz && \
	rm -rfv v0.3.tar.gz && \
	mv massdns-0.3/* . && \
	rm -rfv massdns-0.3 && \
	make

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
	wget https://raw.githubusercontent.com/Anon-Exploiter/subdomainsEnumerator/master/automateSubdEnum.sh -O automateSubdEnum.sh

RUN apt-get purge -y wget git unzip && \
	apt-get autoremove -y

CMD ["/bin/bash", "-c", "/bin/bash automateSubdEnum.sh"]