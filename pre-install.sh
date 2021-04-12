#
# CENTOS 7 base_os
#

# singularity (for shapeit4)

yum update -y && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y singularity


## snptest
wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_static.tgz && \
    tar zxf snptest_v2.5.2_CentOS6.5_x86_64_static.tgz && \
    mv snptest_v2.5.2_linux_x86_64_static/snptest_v2.5.2 /usr/local/bin/snptest

## gcta
wget https://cnsgenomics.com/software/gcta/bin/gcta_1.93.2beta.zip && \
    unzip gcta_1.93.2beta.zip && \
    mv gcta_1.93.2beta/gcta64 /usr/local/bin/gcta64

## qctool

# need to get a newer version of libstdc++
wget https://repo.anaconda.com/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh && \
    bash Anaconda3-2019.07-Linux-x86_64.sh -b -p /home/centos/anaconda3 && \
    cp /home/centos/anaconda3/lib/libstdc++.so.6.0.26 /usr/lib64 && \
    rm /usr/lib64/libstdc++.so.6 && \
    ln -s /usr/lib64/libstdc++.so.6.0.26 /usr/lib64/libstdc++.so.6

yum install -y lapack

wget https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.8-CentOS_Linux7.6.1810-x86_64.tgz && \
    tar zxf qctool_v2.0.8-CentOS_Linux7.6.1810-x86_64.tgz && \
    mv qctool_v2.0.8-CentOS\ Linux7.6.1810-x86_64/qctool /usr/local/bin



## plink
wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20201019.zip && \
    unzip plink_linux_x86_64_20201019.zip \
    mv plink /usr/local/bin


## beagle 4
wget https://faculty.washington.edu/browning/beagle/beagle.r1399.jar && \
    mv beagle.r1399.jar /usr/local/bin/


## shapeit4 has to be run through singularity
## taniguti/shapeit4
##
## singularity build shapeit4.sif docker://taniguti/shapeit4
##
## mount optionsuch as --bind might be needed
## singularity exec shapeit4.sif  shapeit4