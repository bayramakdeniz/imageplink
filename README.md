# Plink in Docker

## Description
A docker container containing PLINK 1.9 (http://www.cog-genomics.org/plink2) for various types of genetic analyses. 

## Basic Usage
There are two general ways to use this image, interactively and passively. The WORKDIR here is /, so structure your commands accordingly if using passive mode. Also, to make this actually useful you'll likely want to mount a volume to store and save results. See Docker's documentation for help on this.

#### Interactive Usage
`docker run --rm -it docker-plink`

#### Passive Usage
`docker run --rm -it docker-plink plink <opts>`

## Citations
Plink2 is the work of Christopher Chang.

**If you use this to create published materials, make sure to cite him:**

Chang, C. C., Chow, C. C., Tellier, L. C., Vattikuti, S., Purcell, S. M., & Lee, J. J. (2015). Second-generation PLINK: rising to the challenge of larger and richer datasets. GigaScience, 4, 7. http://doi.org/10.1186/s13742-015-0047-8

You can acknowledge me for the Docker version if you want.

# imageplink
