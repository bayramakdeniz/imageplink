# Docker and Singularity containers for GWAS analysis

Docker and Singularity containers to perform Genome-wide association study (GWAS) via Plink 1.9 (http://zzz.bwh.harvard.edu/plink/) .

## Getting Started

In order to run the developed Docker and Singularity containers you need to install Docker (https://docs.docker.com/get-docker/) and Singularity (https://sylabs.io/guides/3.6/user-guide/quick_start.html?highlight=install),  respectively. You can run each container separately.

Note that you can try many different analysis other than the one  presented here as  example. For more detailed information related to GWAS analysis, please have a look for [1]  (http://zzz.bwh.harvard.edu/plink/) and [2] (https://www.intro-statistical-genetics.com/data-code ) (ch. 8 and 9).  

## For Docker Container

1. Pull the docker container from Docker Hub

```
docker pull bayramalex/imageplink

```

2. You can run the pulled containers in different ways based on the purpose

### Passive mode

```
docker run  bayramalex/imageplink <your Plink analysis>

```

Example: 

```
docker run  bayramalex/imageplink  ./plink   	 --bfile 1kg_EU_qc\
         	 --pheno BMI_pheno.txt \
       	 --make-bed --out 1kg_EU_BMI 
    
 ```


### Interactive mode

```
docker run  -it bayramalex/imageplink

```

Once you run the code, you have entered inside the container (indicated by '#' sign), then you can run any analysis without typing docker commands as:



Example: 

```
./plink   	 --bfile 1kg_EU_qc\
         	 --pheno BMI_pheno.txt \
       	 --make-bed --out 1kg_EU_BMI 
	 
	 
```
 
You can observe the created  1kg_EU_BMI.bed + 1kg_EU_BMI.bim + 1kg_EU_BMI.fam  inside the container. Now you can perform GWAS analysis as


```
./plink    	 --bfile 1kg_EU_BMI \
        	 --snps rs9674439 \
       	 --assoc \
      	 --linear \
      	 --out BMIrs9674439
```



### Mounting your data to container
It is desired to do analysis with your own data. At this point it is required to mount  a path to the container and do analysis on the data in this path. 

```
docker run  -it -v  /your/local/path:/INPUT bayramalex/imageplink

```
For  example

```
docker run  -it -v  /Users/bayramakdeniz/mydataset:/INPUT bayramalex/imageplink

```

Once you run this, you will observe an interactive container with an additional INPUT folder which is actually /your/local/path. Now you can do your analysis with your data by indicating the place of it by "INPUT/ "   such as: 


```
./plink    	 --bfile INPUT/1kg_EU_BMI \
        	 --snps rs9674439 \
       	 --assoc \
      	 --linear \
      	 --out INPUT/BMIrs9674439
```
 
 Keep in mind that, the generated outputs after analysis can be both found in INPUT/ and /your/local/path.
 
 It is also possible to run it with passive mode as:
 
 ```
docker run   -v  /your/local/path:/INPUT bayramalex/imageplink ./plink    --bfile INPUT/1kg_EU_BMI \
        	 --snps rs9674439 \
       	 --assoc \
      	 --linear \
      	 --out INPUT/BMIrs9674439
    
```
 



## For Singularity Container

1- Build Singularity image from Docker Hub

 ```
singularity build imagename.sif docker://bayramalex/imageplink:latest

```

Alternatively you can build it as  'sandbox' to use it in passive mode

```
singularity build --sandbox imagename/  docker://bayramalex/imageplink:latest

```

Here  a container folder called imagename is created in the working directory. You can cd to this folder and work as if you  are working in the passive mode in Docker.


2- Go to the directory where your data is: cd ~/your/local/path



Run the container by mounting this directory

```
singularity exec -B  $(pwd):/INPUT /path/of/the/container/imagename.sif  <your plink analysis>

```

For Example


singularity exec -B  $(pwd):/INPUT /home/bayram/Gwas/imagename.sif  /plink   --bfile  1kg_EU_qc\
 --pheno BMI_pheno.txt \
 --make-bed --out 1kg_EU_BMI 


```
singularity exec -B  $(pwd):/INPUT /home/bayram/Gwas/imagename.sif  /plink    	 --bfile 1kg_EU_BMI \
        	 --snps rs9674439 \
       	 --assoc \
      	 --linear \
      	 --out BMIrs9674439
```

Warning: A slight difference in Singularity compared to Docker container is: you need to run as  /plink instead of  ./plink


## References

[1] Chang, C. C., Chow, C. C., Tellier, L. C., Vattikuti, S., Purcell, S. M., & Lee, J. J. (2015). Second-generation PLINK: rising to the challenge of larger and richer datasets. GigaScience, 4, 7. http://doi.org/10.1186/s13742-015-0047-8

[2] MILLS, Melinda C.; BARBAN, Nicola; TROPF, Felix C. An Introduction to Statistical Genetic Data Analysis. MIT Press, 2020.




