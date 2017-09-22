This repository contains sample files for deploying IBM Integration Bus v10 and IBM MQ v9 on AWS in two different configurations

These are:
1. Build and deploy an AMI consisting of IBM Integration Bus only. There is no associated Integration node queue manager
2. Build and deploy an AMI consisting of IBM Integration Bus and IBM MQ together in which there is an Integration node and associated queue manager


#1 IBM Integration Bus
This method will build an AMI with IBM Integration Bus v10.0.0.10 installed on top of Ubuntu 14.04 LTS and then start an instance of this AMI and create an Integration node called iibNodeA1 with an integration server name of default.

First read the article at https://developer.ibm.com/integration/blog/2020/09/01/basic-deployment-ibm-integration-bus-amazon-web-services/

Use the following files from the iib directory: iib-aws.json, install-iib.sh and iib-CF-Template.json


#2 IBM Integration Bus and IBM MQ
This method will build an AMI with IBM Integration Bus v10.0.0.10 and IBM MQ v9.0 installed on top of Ubuntu 14.04 LTS and then start an instance of this AMI and create an Integration node called iibNodeX1 with an Integration server name of default. The Integration node will have a local queue manager called iibNodeX1_qmgr

First read the article at  
https://developer.ibm.com/integration/blog/2017/09/21/basic-deployment-of-iib-mq-in-amazon-web-services

Use the following files from the iib-mq directory: iib-mq-aws.json, iib-mq-install.sh and iib-mq-CF-Template.json
