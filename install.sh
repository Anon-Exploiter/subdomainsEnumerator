
apt-get update -y && \
	apt-get install -y wget python3 python3-pip unzip && \
	export PATH="${PATH}:/root/bins/"

cd && \
	mkdir /root/Sublist3r && cd /root/Sublist3r && \
	wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/sublist3r.py -O sub.py && \
	cat sub.py | sed 's/from subbrute import subbrute//i' > sublist3r.py && \
	pip3 install argparse dnspython requests idna && \
	rm -rfv requirements.txt && rm -rfv sub.py

cd && \
	mkdir OneForAll && cd OneForAll && \
	wget https://github.com/shmilylty/OneForAll/archive/v0.3.0.tar.gz && \
	tar -xvf v0.3.0.tar.gz && \
	rm -rfv v0.3.0.tar.gz && \
	mv OneForAll-0.3.0/* . && rm -rfv OneForAll-0.3.0 && \
	pip3 install -r /root/OneForAll/requirements.txt

cd && \
	mkdir massdns && cd massdns && \
	wget https://github.com/blechschmidt/massdns/archive/v0.3.tar.gz && \
	tar -xvf v0.3.tar.gz && \
	rm -rfv v0.3.tar.gz && \
	mv massdns-0.3/* . && \
	rm -rfv massdns-0.3 && \
	make
	cp bin/massdns /usr/bin/massdns && chmod +x /usr/bin/massdns

cd && \
	mkdir bins && cd bins && \
	wget https://github.com/projectdiscovery/subfinder/releases/download/2.3.5/subfinder_2.3.5_linux_386.tar.gz && \
	wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz && \
	wget https://github.com/OWASP/Amass/releases/download/v3.7.2/amass_linux_amd64.zip && \
	wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux && \
	cp assetfinder /usr/bin/ && chmod +x /usr/bin/assetfinder && \
	cp subfinder /usr/bin/ && chmod +x /usr/bin/subfinder && \
	cp findomain-linux /usr/bin/ && chmod +x /usr/bin/findomain-linux


cd && \
	cd bins && \
	tar -xvf subfinder_2.3.5_linux_386.tar.gz && \
	tar -xvf assetfinder-linux-amd64-0.1.0.tgz && \
	unzip amass_linux_amd64.zip && \
	chmod +x findomain-linux

cd && \
	cd bins && \
	rm -rfv LICENSE README.md && \
	rm -rfv *.tgz *.zip *.tar.gz && \
	mv amass_linux_amd64/amass . && \
	rm -rfv amass_linux_amd64


cd && \
	go install github.com/d3mondev/puredns/v2@latest && \
	cp ~/go/bin/puredns /usr/bin && chmod +x /usr/bin/puredns
	
	# for google cloud shell
	# go install github.com/d3mondev/puredns/v2@latest && \
        # cp /root/gopath/bin/puredns /usr/bin && chmod +x /usr/bin/puredns
	
cd && \
	git clone https://github.com/edoardottt/scilla.git && cd scilla/  && \
	go get && make linux && \
	cp ~/go/bin/scilla /usr/bin/ && chmod +x /usr/bin/scilla

# Wordlists

cd && \
	mkdir -p ~/wordlists/ && cd ~/wordlists/  && \
	wget https://wordlists-cdn.assetnote.io/data/manual/2m-subdomains.txt -O 2m-subdomains.txt && \
	wget https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt -O resolvers.txt && \
	wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt -O best-dns-wordlist.txt
 
cd && \
	go install github.com/lc/gau/v2/cmd/gau@latest && \
	go install github.com/tomnomnom/unfurl@master && \
	cp ~/go/bin/gau /usr/bin/gau && chmod +x /usr/bin/gau && \
	cp ~/go/bin/unfurl /usr/bin/unfurl && chmod +x /usr/bin/unfurl

cd && \
	git clone --recursive https://github.com/screetsec/Sudomy.git && \
	cd Sudomy && \
	python3 -m pip install -r requirements.txt && \
	cp sudomy /usr/bin/sudomy && chmod +x /usr/bin/sudomy

cd && \
	mkdir -p github-search && cd /root/github-search && \
	wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py -O github-subdomains.py && \
	wget https://raw.githubusercontent.com/gwen001/github-search/master/requirements3.txt -O requirements.txt && \
	pip3 install -r requirements.txt && \
	echo "your token here" > .tokens

