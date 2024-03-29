# Neper-Docker
<p align="center">
  <img width="450" height="300" src="https://github.com/jonathanhestroffer/Neper-Docker/blob/master/preview.png">
</p>

Neper-Docker is a Docker container for [Neper](neper.info): polycrystal generation and meshing. The latest Docker image available is of Neper version 4.2.0. A Dockerfile is also provided in this repository to build an image based on the latest development version of Neper. The Dockerfile has been tested for Neper version 4.2.0, future Neper builds may require additional dependencies.

## Installation

#### Pulling Docker Image (Recommended)

Install and run [Docker](https://docs.docker.com/), then within your command-line shell of choice, pull the Neper Docker image.

```bash
docker pull jonathanhestroffer/neper
```

#### Building Image from Dockerfile

While a much slower process, you can also choose to build Neper from the Dockerfile provided. In a directory containing only the Dockerfile provided, run the following command:

```bash
docker build -t jonathanhestroffer/neper .
```

Note: Any edits made to the Dockerfile to achieve a customized build might affect the stability of Neper.

## Basic Usage

#### Running Docker Container

The preferred method of running the Docker container is with the command ```docker run --rm -it -v <host directory>:<container directory> jonathanhestroffer/neper```.

Example:
```bash
docker run --rm -it -v F:/NeperTest/:/work jonathanhestroffer/neper
```

The above deploys a container with directory ```/work``` synced to the ```/NeperTest``` directory on the host machine. After execution of Neper, all output files can be copied to the host directory.

After initializing the container, cd into the ```/neper``` directory to begin working.

```bash
cd neper
```

#### Tessellation, Meshing and Visualization Example

Generate a 10-cell tessellation and its mesh, then visualize both on the host system as "n10.png". 

```bash
neper -T -n 10 -o n10
```
```bash
neper -M n10.tess
```
```bash
neper -V n10.tess,n10.msh -dataelsetcol id -print n10
```
		
![Visualization](https://github.com/jonathanhestroffer/Neper-Docker/blob/master/n10.png)
    
When finished, stop and exit the Docker container with

```bash
exit
```
