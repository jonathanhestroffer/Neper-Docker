<p align="center">
  <img width="450" height="300" src="https://github.com/jonathanhestroffer/Neper-Docker/blob/master/preview.png">
</p>

# Neper-Docker
Docker container for Neper: polycrystal generation and meshing. This containerized format of Neper allows for easy installation and portability of the latest development version of Neper.

## Overview
Neper runs on any Unix-like system. For Windows or MacOS users this typically requires the creation of a virtual machine (VM). Another option is containerization. Containerization of applications brings many benefits, including the following:

* Portability between different platforms and clouds — it's truly write once, run anywhere. 
* Efficiency through using far fewer resources than VMs and delivering higher utilization of compute resources.

This particular containerization is accomplished through the use of Docker Desktop.

## Installation

1.  Download Docker Desktop

    https://www.docker.com/products/docker-desktop

2.  Download github repository

3.  Open Windows Powershell and cd into the directory where the repository was downloaded

4.  Build Docker image from Dockerfile - "docker build -t 'name of image here' ."
        
        $ docker build -t neper .

    This will take several minutes to download all required programs and dependencies for use of Neper as well as test the neper build. For more information of what packages are being downloaded or if you want to customize the final container that is created feel free to look at the contents of the DockerFile which is written in Bash.

5.  Once complete you can view the docker image(s) you have available with "docker images"

        $ docker images
        
6. Run Neper image as a container with access to host system files

        $ docker run --rm -it -v F:\Projects\Neper\:/work neper

    This command starts and runs a Docker container interactively based on the image "neper" created earlier. This command also mounts the specified directory on the host inside the container at the specified path. In the example above the host path F:\Projects\Neper\ is available as /work inside the container. This is a way of either feeding information into your container, or providing a way for your container to make files accessible to the host. 
    
    *Please note that the backslashes \ will become forward slashes / in the command for Mac and Unix systems. 
    
7. cd into the /work directory of the container and start using Neper!
    
    Generate a 10-cell tessellation and its mesh, then visualize both on the host system as "n10.png". 

        $ neper -T -n 10 -o n10
		$ neper -M n10.tess
		$ neper -V n10.tess,n10.msh -dataelsetcol id -print n10
		
	![Visualization](https://github.com/jonathanhestroffer/Neper-Docker/blob/master/n10.png)
        
    All files created will be available on the host system for you to view as normal as will any other file created during your use of Neper.
    
8. When finished, close/stop the Docker container.

        $ exit
        
    This command will exit the container as well as remove it because of the --rm option used in the previous run command.

## Supplementary Material

Also provided in this repository is an example of using Neper to generate tessellation and mesh files from experimentally obtained voxelated microstructures (Raster Tessellation in Neper terminology). This is available in the TESR_example folder and contains example scripts for generating necessary files for Neper. There are also example Neper commands provided in the scripts.sh file. Some of these are out-dated and should be reviewed alongside the Neper manual "neper.pdf".

## References

**Neper**

http://www.neper.info/

https://github.com/rquey/neper

For help with Neper subscribe to the Neper mailing list 

https://sourceforge.net/projects/neper/lists/neper-users



**Docker**

https://www.docker.com/
