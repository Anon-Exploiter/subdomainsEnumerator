#!/bin/bash

mainPATH=$(pwd)/
bar="---------------------------------------"

echo -e "\n$bar\n\tSubdomains Enumerator\n$bar\n"

read -p "Please enter target (i.e. site.com): " domain

HOST=$domain
 
##

sublist3rPATH=../results/$HOST-sublist3r.txt
subfinderPATH=./results/$HOST-subfinder.txt
amassPATH=./results/$HOST-amass.txt
oneForAllPATH=../results/
assetfinderPATH=./results/$HOST-assetfinder.txt

##

function automateSublist3r() {
	echo -e "\n$bar\n\tRunning Sublist3r\n$bar\n"
	cd $mainPATH
	cd Sublist3r/
	source ./env/bin/activate
	python sublist3r.py -v -t 100 -o $sublist3rPATH -d $HOST
}

function automateSubfinder() {
	echo -e "\n$bar\n\tRunning Subfinder\n$bar\n"
	cd $mainPATH
	subfinder -o $subfinderPATH -t 100 -d $HOST 
}

function automateAmass() {
	echo -e "\n$bar\n\tRunning Amass\n$bar\n"
	cd $mainPATH
	amass enum -active -o $amassPATH -d $HOST
}

function automateOneForAll() {
	echo -e "\n$bar\n\tRunning OneForAll\n$bar\n"
	cd $mainPATH
	cd OneForAll/
	source ./env/bin/activate
	python oneforall.py --target $HOST run --path=$oneForAllPATH
	cd $mainPATH/results/
	rm -rf *.csv
	mv all_subdomain_result* oneforall.txt
}

function automateAssetsFinder() {
	echo -e "\n$bar\n\tRunning Assets finder\n$bar\n"
	cd $mainPATH
	assetfinder --subs-only $HOST | tee $assetfinderPATH
}

function sortResults() {
	cd $mainPATH
	cd results/
	cat *.txt | sed "s/www.//" | sed "s/nwww.//" | sort | uniq > results.txt

	echo -e "\n$bar\nFinal Results:\n$bar\n"
	echo -e "[#] Subdomains Count: $(wc -l < results.txt)\n"

	cat results.txt
}

function resolveSubdomains() {
	cd /root/massdns/
	cat /root/results/results.txt | /root/massdns/bin/massdns -r /root/massdns/lists/resolvers.txt -t A -o S -w /root/massdns/results-resolved.txt

	echo -e "\n$bar\nResolved Results:\n$bar\n"
	echo -e "[#] Resolved Count: $(wc -l < /root/massdns/results-resolved.txt)\n"
	cat /root/massdns/results-resolved.txt
}

automateSublist3r $HOST
automateSubfinder $HOST
automateAmass $HOST
automateOneForAll $HOST
automateAssetsFinder $HOST

sortResults
resolveSubdomains
