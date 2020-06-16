# Subdomains Enumerator
A docker image which will enumerate, sort and unique the results of various subdomains enumeration tools. 

## Building the docker image
You can build the docker image yourself using the following:

```bash
git clone https://github.com/Anon-Exploiter/subdomainsEnumerator && cd subdomainsEnumerator
docker build -t uexpl0it/subdomains-enumerator:0.2 .
docker run -it --rm uexpl0it/subdomains-enumerator:0.2
```

## Using Image from Dockerhub
In case you don't want to build the image yourself, just execute the line below and you'll be done and dusted. 

```bash
docker run -it --rm uexpl0it/subdomains-enumerator:0.2
```

## Docker HUB Page
https://hub.docker.com/r/uexpl0it/subdomains-enumerator

## Tools
Currently integrated tools include:
* [Sublist3r](https://github.com/aboul3la/Sublist3r)
* [Subfinder](https://github.com/projectdiscovery/subfinder)
* [Amass](https://github.com/OWASP/Amass)
* [OneForAll](https://github.com/shmilylty/OneForAll/)
* [Asset Finder](https://github.com/tomnomnom/assetfinder)
* [MassDNS](https://github.com/blechschmidt/massdns)
* [Findomain](https://github.com/Edu4rdSHL/findomain)

## Contribution
Want to add another tools? If you can, make a PR editing the bash file containing script's args etc. & Dockerfile containing the cloning and setting up. 

In case you can't, no problem, file a issue with the tool name and the features you would like to have and I'll try to work on the integration. 

## Change log

| Changes                                                      | Release                                             |
| ------------------------------------------------------------ | --------------------------------------------------- |
| Added MassDNS for also resolving the subdomains results.     | 0.2 - 03-06-2020                                  |
| Initial release containing sublist3r, subfinder, amass, oneforall & asset finder. | 0.1 - 21-05-2020                                  |


