FROM haskell:7.10.2

ENV CRUX_GIT 'https://github.com/cruxlang/crux'

# Download OS dependencies and clean
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 575159689BEFB442 && \
	echo 'deb http://download.fpcomplete.com/debian jessie main'| tee /etc/apt/sources.list.d/fpco.list && \
	apt-get update && apt-get install -y \
		build-essential \
		curl \
		git \ 
		stack && \
	apt-get clean

# Install Node 6.x
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
	apt-get install -y nodejs

# Clone CruxLang, install and test
RUN cd && \
	git clone ${CRUX_GIT} && \
	cd crux && \
	stack install && \
	stack test

# Clean root directory
RUN cd && \
	rm -rf ./*

CMD ['crux']