FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="${PATH}:/usr/local/go/bin:/root/go/bin"
ENV GO111MODULE=on

RUN apt-get update -y
RUN apt-get install -y git wget curl file python3 python3-pip python3-venv

WORKDIR /root/

RUN git clone https://github.com/udhos/update-golang && \
	cd update-golang && \
	./update-golang.sh && \
	rm -rf /root/update-golang

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

RUN go get -v github.com/projectdiscovery/subfinder/cmd/subfinder && \
	go get -v github.com/OWASP/Amass/v3/... && \
	go get -u github.com/tomnomnom/assetfinder

RUN mkdir results && \
	wget https://raw.githubusercontent.com/Anon-Exploiter/subdomainsEnumerator/master/automateSubdEnumv2.sh

CMD ["/bin/bash", "-c", "/bin/bash automateSubdEnumv2.sh"]
