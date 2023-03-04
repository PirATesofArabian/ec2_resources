#!bin/bash
################
#script to check the EC2 resources using during a particular time through cronjob
###############
#Author: Yashwanth , yashwanthbs55@gmail.com
#Things we are tracking
#EC2 insances, lamba functions, s3 buckets, EBS volumes

#installing the json paser(jq) in ubunut/linux/your os
sudo apt-get install jq -y > * 2>/dev/null

echo "The EC2 instances in the account are:"
aws ec2 describe-instances |jq '.Reservations[].Instances[].InstanceId'

echo "The lamba functions in the account are:"
aws lambda list-functions|jq '.Functions[].FunctionName'

echo "The EBS volumes in the account are:"
aws ec2 describe-volumes|jq '.Volumes[].InstanceId'
echo "state of volume:"
aws ec2 describe-volume |jq '.Volumes[].State'

