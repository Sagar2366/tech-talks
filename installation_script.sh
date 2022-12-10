#!/bin/bash


echo "#####################################################"
echo "Installing KOPS"
echo "#####################################################"
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops


echo "#####################################################"
echo "Installing kubectl"
echo "#####################################################"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client



echo "#####################################################"
echo "Installing AWS CLI"
echo "#####################################################"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install unzip
unzip awscliv2.zip
sudo ./aws/install
aws --version

echo "#####################################################"
echo "Installing HELM"
echo "#####################################################"


curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


echo "#####################################################"
echo "Setting up environment"
echo "#####################################################"

API_KEY=<<API_KEY>>
ACCESS_KEY=<<ACCESS_KEY>>

aws configure set aws_access_key_id $API_KEY
aws configure set aws_secret_access_key $ACCESS_KEY
aws configure set aws_region ap-south-1
aws configure set aws_output json

export KOPS_STATE_STORE=s3://kops-cluster-state-bucket
kops export kubecfg --name kopstest.k8s.local --admin

echo "#####################################################"
echo "Done"
echo "#####################################################"

