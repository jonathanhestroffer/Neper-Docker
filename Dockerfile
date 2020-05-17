FROM ubuntu:18.04

# Installing General Programs and Neper Dependencies
RUN \
	apt-get update && apt-get -y install \
	build-essential \
	git \
	libgsl-dev \
	libnlopt-dev \
	libscotch-6.0 \
	libpthread-stubs0-dev \
	gmsh \
	cmake

# Building POV-Ray Dependency
RUN \
	apt-get update && apt-get -y install \
	zlib1g-dev \
	libpng-dev \
	libjpeg-dev \
	libtiff-dev \
	libboost-thread-dev \
	autoconf
RUN \
	mkdir /src && \
	cd /src && \
	git clone https://github.com/POV-Ray/povray.git && \
	cd povray/unix && \
	./prebuild.sh && \
	cd .. && \
	./configure COMPILED_BY="Jonathan Hestroffer <jonathanhestroffer@ucsb.edu>" && \
	make && \
	make install

# Building Neper 
RUN git clone https://github.com/rquey/neper.git && \
	cd /neper && \
	cmake /neper/src/ && \
	make && \
	make install && \
	make test

CMD ["/bin/bash"]
