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

    Change file permission to 600 -
                chmod 600 acd_private.pem
    Create public key for downloaded private key using -
                ssh-keygen -y -f acd_private.pem > acd_public.pub
    
    ```



3. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), [KOPS](https://kops.sigs.k8s.io/getting_started/install/), [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) 



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
        --bastion
        --ssh-public-key ~/.ssh/acd_public

    kops edit cluster acd.k8s.local

    kops update cluster

    kops update cluster --yes

    kops get cluster

    kops validate cluster

    kubectl get nodes

    kubectl get pods -n kube-system

    ```


### Launch Bastion and SSH access to clusters
```
    kops create instancegroup bastion-ig --role Bastion --subnet public_subnet --name acd.k8s.local

    kops edit ig bastions --name  bastion-ig

    kops update cluster

    kops update cluster --yes

    kops get cluster

    Update security group to allow SSH traffic on bastion

    Setup AWS CLI, KOPS, Kubectl, environment variables to access kubernetes cluster

    Export kubeconfig to interact with cluster : kops export kubecfg --name acd.k8s.local

```


### Upgrading clusters
```
    kops get ig
    kops edit ig <<instance_group_name>>

    kops get cluster
    kops edit cluster acd.k8s.local

    kops update cluster

    kops update cluster --yes
    
    kops validate cluster

    kops rolling-update cluster --name acd.k8s.local --instance-group <MASTER_NODE_IG_NAME> --yes

    kops validate cluster 

    kops get cluster
    
```

### Deploy sample application in K8S cluster
```
    helm install --create-namespace --namespace hello-kubernetes custom-message ./hello-kubernetes \
        --set message="Thank you for joining us at AWS Community Day Pune 2022 !!!"

    # get the LoadBalancer ip address.
    kubectl get svc hello-kubernetes-custom-message -n hello-kubernetes -o 'jsonpath={ .status.loadBalancer.ingress[0].ip }'

    kubectl create deployment my-nginx --image=nginx --replicas=1 --port=80; 
    kubectl expose deployment my-nginx --port=80 --type=LoadBalancer;
    kubectl get pods
    kubectl get svc my-nginx

```

### Addons
- [Monitoring for K8S cluster](https://docs.wavefront.com/kubernetes.html?utm_source=Website&utm_medium=referral&utm_campaign=integrations-page)
- [RBAC Setup](https://pracucci.com/kubernetes-rbac-with-kops.html)
- [Verify cluster security using kube-bench](https://github.com/aquasecurity/kube-bench/blob/main/docs/running.md#running-kube-bench)
- [Audit Logging](https://kops.sigs.k8s.io/cluster_spec/#audit-logging)
- [Infrastructure and cost alerts](https://docs.kubecost.com/install-and-configure/install)
- [More information](https://kops.sigs.k8s.io/getting_started/production/)


### Cleanup
Finally, To delete your cluster and all of it’s supporting resources, simply run the following command
```
    kops delete cluster --name sanjaybalaji.k8s.local --yes
```
For the S3 bucket, you would have to clean it and delete it from the AWS Console GUI.



