## [AWS COMMUNITY DAY 2022 Pune](https://acdpune.in/)

## Activities needed to get a production ready K8S cluster in AWS using KOPS


### Setup k8s Cluster in AWS using KOPS

1. Setup AWS environment 

    [IAM User setup](https://kops.sigs.k8s.io/getting_started/aws/#setup-iam-user)
    
    [Configure DNS](https://kops.sigs.k8s.io/getting_started/aws/#configure-dns)
    
    [Cluster state storage - S3 bucket with versioning enabled](https://kops.sigs.k8s.io/getting_started/aws/#cluster-state-storage)
    
    Create SSH keypair on AWS, download it locally
    



2. Prepare Local environemnt
    ```
    export NAME=acd.k8s.local
    
    export KOPS_STATE_STORE=s3://acd_cluster_s3_bucket

    Create public key for downloaded private key using -
                ssh-keygen -y -f acd_private.pem > acd_public.pub
    
    Change file permission to 600
    ```



3. Install
```
    [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

    [KOPS](https://kops.sigs.k8s.io/getting_started/install/)

    [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) 
```



4. Launch KOPS cluster in AWS
    ```
    kops create cluster --name acd.k8s.local 
        --cloud aws 
        --node-count 3 
        --master-count 3 
        --zones us-west-2a,us-west-2b,us-west-2c 
        --master-zones us-west-2a,us-west-2b,us-west-2c  
        --dns private 
        --node-size m5.large 
        --master-size m3.medium 
        --topology private 
        --networking calico 
        --vpc <<VPC_ID>>
        --ssh-public-key ~/.ssh/acd_public
    ```

### SSH access to clusters
1. 
- Upgrading clusters
- Monitoring for K8S cluster
- RBAC Setup
- Audit Logging
- Infrastructure and cost alerts



