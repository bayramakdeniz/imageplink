FROM 'ubuntu:18.04'

RUN apt-get update && apt-get install -y  --no-install-recommends apt-utils\
    python3 \
    python3-pip \
    tar \
    wget \
    unzip \
    && \
    rm -rf /var/lib/apt/lists/*

RUN  (  wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20200616.zip && \
     unzip plink_linux_x86_64_20200616.zip && \
     rm -rf plink_linux_x86_64_20200616.zip)
     


RUN wget https://5c2d08d4-17d1-4dd8-bb49-f9593683e642.filesusr.com/archives/e7bc47_f74626b357ed453584e9e775713fe9ac.zip?dn=data_chapter10.zip

RUN unzip -j  e7bc47_f74626b357ed453584e9e775713fe9ac.zip?dn=data_chapter10.zip -d /
