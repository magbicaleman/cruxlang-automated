FROM haskell:7.10.2

ENV CRUX_GIT 'https://github.com/cruxlang/crux'

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442 && \
	echo 'deb http://download.fpcomplete.com/debian jessie main'| tee /etc/apt/sources.list.d/fpco.list && \
	apt-get update && apt-get install -y \
		build-essential \
		curl \
		git \ 
		stack && \
	apt-get clean
