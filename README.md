## Admin

### Create a conda environment

conda create -n aws python=3.8
conda activate aws
pip install awscli aws-parallelcluster

### Create a EC3 key pair

Go to AWS console, and create a key pair, which is region specific (I use 'us-east-2')

### Run pcluster configure

Note: SGE and Torque are no longer supported, Slurm is the only feasible option

Headnode Instance type: https://aws.amazon.com/ec2/instance-types/


https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html#ec2-on-demand-instances-limits

NOTE: For real cluster, we will need to choose more powerful computing nodes.

1. Head node in a public subnet and compute fleet in a private subnet
2. Head node and compute fleet in the same public subnet <--- this would allow computing nodes to access internset


```
/.parallelcluster/config will be written.
Press CTRL-C to interrupt the procedure.


Allowed values for AWS Region ID:
1. ap-northeast-1
2. ap-northeast-2
3. ap-south-1
4. ap-southeast-1
5. ap-southeast-2
6. ca-central-1
7. eu-central-1
8. eu-north-1
9. eu-west-1
10. eu-west-2
11. eu-west-3
12. sa-east-1
13. us-east-1
14. us-east-2
15. us-west-1
16. us-west-2
AWS Region ID [us-west-1]: 14
Allowed values for EC2 Key Pair Name:
1. pcluster
EC2 Key Pair Name [pcluster]: 1
Allowed values for Scheduler:
1. sge
2. torque
3. slurm
4. awsbatch
Scheduler [slurm]: 3
Allowed values for Operating System:
1. alinux
2. alinux2
3. centos7
4. centos8
5. ubuntu1604
6. ubuntu1804
Operating System [alinux2]: 3
Minimum cluster size (instances) [0]: 0
Maximum cluster size (instances) [10]: 500
Head node instance type [t2.micro]: t2.small
Compute instance type [t2.micro]: t2.small
Automate VPC creation? (y/n) [n]: y
Allowed values for Network Configuration:
1. Head node in a public subnet and compute fleet in a private subnet
2. Head node and compute fleet in the same public subnet
Network Configuration [Head node in a public subnet and compute fleet in a private subnet]: 1
Beginning VPC creation. Please do not leave the terminal until the creation is finalized
Creating CloudFormation stack...
Do not leave the terminal until the process has finished
Stack Name: parallelclusternetworking-pubpriv-20210412060022
Status: DefaultRouteDependsOnPublic - CREATE_COMPLETE
Status: parallelclusternetworking-pubpriv-20210412060022 - CREATE_COMPLETE
The stack has been created
Configuration file written to /Users/bpeng/.parallelcluster/config
You can edit your configuration file or simply run 'pcluster create -c /Users/bpeng/.parallelcluster/config cluster-name' to create your cluster
```


NOTE:
1. Master node needs to scale up and down, but CPU is not particularly important
2. Master node will serve nfs to computing nodes, so instance type with enough network bandwidth
  and enough dedicated Amazon EBS

* https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html#supported_instances

All current generation instance types support enhanced networking, except for T2 instances.

Storage price differ: https://aws.amazon.com/ebs/pricing/


### Create cluster

pcluster create mycluster


```
 ✗ pcluster create mycluster
Beginning cluster creation for cluster: mycluster
Creating stack named: parallelcluster-mycluster
Status: parallelcluster-mycluster - CREATE_COMPLETE
ClusterUser: centos
MasterPrivateIP: 10.0.0.215
```

```
> pcluster ssh -d mycluster -i ~/.aws/pcluster.pem
SSH command: ssh centos@3.131.162.199 -i /Users/bpeng/.aws/pcluster.pem
```

```
> chmod 600 ~/.aws/pcluster.pem
ssh centos@3.131.162.199 -i /Users/bpeng/.aws/pcluster.pem
Last login: Mon Apr 12 06:32:06 2021
```

Use AWS CloudFormmation to check the status of cluster.

```
sbatch
```
