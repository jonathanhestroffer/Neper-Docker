# Neper-Docker
<p align="center">
  <img width="450" height="300" src="https://github.com/jonathanhestroffer/Neper-Docker/blob/master/preview.png">
</p>

Neper-Docker is a Docker container for [Neper](neper.info): polycrystal generation and meshing. This containerized format of Neper allows for easy installation and portability of the latest development version of Neper.

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
        
All files created will be available on the host system for you to view as normal as will any other file created during your use of Neper.
    
When finished, stop and exit the Docker container with

```bash
exit
```

## Supplementary Material

Also provided in this repository is an example of using Neper to generate tessellation and mesh files from experimentally obtained voxelated microstructures (Raster Tessellation in Neper terminology). This is available in the TESR_example folder and contains example scripts for generating necessary files for Neper. There are also example Neper commands provided in the scripts.sh file. Some of these are out-dated and should be reviewed alongside the Neper manual "neper.pdf".
