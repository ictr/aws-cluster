#
# CENTOS 7 base_os
#

## singularity

yum update -y && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y singularity


## plink

wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20201019.zip && \
    unzip -o plink_linux_x86_64_20201019.zip \
    mv -f plink /usr/local/bin

## shapeit4 using singularity


## beagle 4
wget https://faculty.washington.edu/browning/beagle/beagle.r1399.jar && \
    mv -f beagle.r1399.jar /usr/local/bin/