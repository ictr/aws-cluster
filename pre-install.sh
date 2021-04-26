#
# CENTOS 7 base_os
#
echo '#'
echo '#'
echo '# install snptest'
echo '#'
echo '#'
wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_static.tgz && \
    tar zxf snptest_v2.5.2_CentOS6.5_x86_64_static.tgz && \
    mv -f snptest_v2.5.2_linux_x86_64_static/snptest_v2.5.2 /usr/local/bin/snptest

echo '#'
echo '#'
echo '# install gcta64 to /usr/local/bin'
echo '#'
echo '#'
wget https://cnsgenomics.com/software/gcta/bin/gcta_1.93.2beta.zip && \
    unzip gcta_1.93.2beta.zip && \
    mv -f gcta_1.93.2beta/gcta64 /usr/local/bin/gcta64

echo '#'
echo '#'
echo '# install miniconda to get libstdc++'
echo '#'
echo '#'
# need to get a newer version of libstdc++
#wget https://repo.anaconda.com/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh && \
#    bash Miniconda3-4.7.12-Linux-x86_64.sh -ubp /usr/share/anaconda3 && \
#    cp /usr/share/anaconda3/lib/libstdc++.so.6.0.26 /usr/lib64 && \
#    rm /usr/lib64/libstdc++.so.6 && \
#    ln -s /usr/lib64/libstdc++.so.6.0.26 /usr/lib64/libstdc++.so.6
wget https://raw.githubusercontent.com/ictr/aws-cluster/main/resource/qctool_lib -O libstdc++.so.6.0.26 && \
    mv -f libstdc++.so.6.0.26 /usr/lib64 && \
    rm /usr/lib64/libstdc++.so.6 && \
    ln -s /usr/lib64/libstdc++.so.6.0.26 /usr/lib64/libstdc++.so.6

echo '#'
echo '#'
echo '# install lapack for qctool'
echo '#'
echo '#'
yum install -y lapack

echo '#'
echo '#'
echo '# install qctool to /usr/local/bin'
echo '#'
echo '#'
wget https://www.well.ox.ac.uk/~gav/resources/qctool_v2.0.8-CentOS_Linux7.6.1810-x86_64.tgz && \
    tar zxf qctool_v2.0.8-CentOS_Linux7.6.1810-x86_64.tgz && \
    mv -f qctool_v2.0.8-CentOS\ Linux7.6.1810-x86_64/qctool /usr/local/bin


echo '#'
echo '#'
echo '# install plink to /usr/local/bin'
echo '#'
echo '#'
wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20201019.zip && \
    unzip -o plink_linux_x86_64_20201019.zip && \
    mv -f plink /usr/local/bin


echo '#'
echo '#'
echo '# install beagle4 to /usr/local/bin'
echo '#'
echo '#'
wget https://faculty.washington.edu/browning/beagle/beagle.r1399.jar && \
    mv -f beagle.r1399.jar /usr/local/bin/



echo '#'
echo '#'
echo '# install singularity (slow due to yum update)'
echo '#'
echo '#'
yum update -y && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y singularity


echo '#'
echo '#'
echo '# build singularity image for shapeit4'
echo '# Use '
echo '#   > singularity exec /usr/local/bin/shapeit4.sif shapeit4 '
echo '# to run.'

## shapeit4 has to be run through singularity
## taniguti/shapeit4
##
singularity build shapeit4.sif docker://taniguti/shapeit4 && \
    mv shapeit4.sif /usr/local/bin

##
## mount optionsuch as --bind might be needed
## singularity exec shapeit4.sif  shapeit4