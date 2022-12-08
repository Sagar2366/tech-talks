## [AWS COMMUNITY DAY 2022 Pune](https://acdpune.in/)

## Activities needed to get a production ready K8S cluster in AWS using KOPS


### Setup k8s Cluster in AWS using KOPS
1. Install
    [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), 
    [KOPS](https://kops.sigs.k8s.io/getting_started/install/),
    [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) 

2. Setup AWS environment 
    [IAM User setup](https://kops.sigs.k8s.io/getting_started/aws/#setup-iam-user)
    [Configure DNS](https://kops.sigs.k8s.io/getting_started/aws/#configure-dns)
    [Cluster state storage - S3 bucket with versioning enabled](https://kops.sigs.k8s.io/getting_started/aws/#cluster-state-storage)

3. Prepare Local environemnt
    ```
    export NAME=acd.k8s.local
    export KOPS_STATE_STORE=s3://acd_cluster_s3_bucket
    ```

### SSH access to clusters
- Upgrading clusters
- Monitoring for K8S cluster
- RBAC Setup
- Audit Logging
- Infrastructure and cost alerts



