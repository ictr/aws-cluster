## singularity

# yum update -y && \
#     yum install -y epel-release && \
#     yum update -y && \
#     yum install -y singularity


## snptest
wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_static.tgz && \
    tar zxf snptest_v2.5.2_CentOS6.5_x86_64_static.tgz && \
    mv snptest_v2.5.2_linux_x86_64_static/snptest_v2.5.2 /usr/local/bin/snptest

## gcta
wget https://cnsgenomics.com/software/gcta/bin/gcta_1.93.2beta.zip && \
    unzip gcta_1.93.2beta.zip && \
    mv gcta_1.93.2beta/gcta64 && /usr/local/bin/gcta64

## qctool, need to get a newer version of libstdc++
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh && \
    bash Anaconda3-2019.07-Linux-x86_64.sh -b && \
    cp /home/centos/anaconda3/lib/libstdc++.so.6.0.26 /usr/lib64 && \
    rm /usr/lib64/libstdc++.so.6 && \
    ln -s /usr/lib64/libstdc++.so.6.0.26 /usr/lib64/libstdc++.so.6

# upgrade libstdc++
wget https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.8-CentOS_Linux7.6.1810-x86_64.tgz && \
    tar zxf qctool_v2.0.8-CentOS_Linux7.6.1810-x86_64.tgz && \
    mv qctool_v2.0.8-CentOS\ Linux7.6.1810-x86_64/qctool /usr/local/bin