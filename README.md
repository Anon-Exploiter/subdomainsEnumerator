# Subdomains Enumerator
A docker image which will enumerate, sort, unique and resolve the results of various subdomains enumeration tools.

[![asciicast](https://asciinema.org/a/360015.svg)](https://asciinema.org/a/360015)

## Building the docker image
You can build the docker image yourself using the following:

```bash
git clone https://github.com/Anon-Exploiter/subdomainsEnumerator && cd subdomainsEnumerator
docker build -t uexpl0it/subdomains-enumerator:0.4 .
docker run -it --rm uexpl0it/subdomains-enumerator:0.4
```

## Using Image from Dockerhub
In case you don't want to build the image yourself, just execute the line below and you'll be done and dusted. 

```bash
docker run -it --rm uexpl0it/subdomains-enumerator:0.4
```

## Previous Releases:
https://hub.docker.com/r/uexpl0it/subdomains-enumerator/tags

## Tools
Currently integrated tools include:
* [Sublist3r](https://github.com/aboul3la/Sublist3r)
* [Subfinder](https://github.com/projectdiscovery/subfinder)
* [Amass](https://github.com/OWASP/Amass)
* [OneForAll](https://github.com/shmilylty/OneForAll/)
* [Asset Finder](https://github.com/tomnomnom/assetfinder)
* [Findomain](https://github.com/Edu4rdSHL/findomain)
* [MassDNS](https://github.com/blechschmidt/massdns)

## Contribution
Want to add another tools? If you can, make a PR editing the bash file containing script's args etc. & Dockerfile containing the cloning and setting up. 

In case you can't, no problem, file a issue with the tool name and the features you would like to have and I'll try to work on the integration. 

## Change log

| Changes                                                      | Release                                             |
| ------------------------------------------------------------ | --------------------------------------------------- |
| Removed virtualenvs, git and other stuff (^while all the listed tools exist) and reduced the size to 200MB+ | 0.4 - 20-06-2020|
| Integrated PR [#1](https://github.com/Anon-Exploiter/subdomainsEnumerator/pull/1) adding [findomain](https://github.com/Edu4rdSHL/findomain) (tool) and reduced image size from ~800 to ~400 MB     | 0.3 - 17-06-2020                                  |
| Added MassDNS for also resolving the subdomains results.     | 0.2 - 03-06-2020                                  |
| Initial release containing sublist3r, subfinder, amass, oneforall & asset finder. | 0.1 - 21-05-2020                                  |


