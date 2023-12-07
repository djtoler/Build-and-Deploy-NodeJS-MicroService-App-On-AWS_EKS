#!/bin/bash

# eksctl create cluster cluster07  --vpc-private-subnets=subnet-0e6f78738aea91837,subnet-0e30f47f5ef109fab  --vpc-public-subnets=subnet-08d7d69c539b857c8,subnet-0320acce5f2641425 --without-nodegroup

# eksctl create nodegroup --cluster cluster07 --node-type t2.medium --nodes 2 

# eksctl create nodegroup --cluster cluster07 --name fpbackend --node-type t2.medium --nodes 2 --node-private-networking --subnet-ids subnet-0e6f78738aea91837,subnet-0e30f47f5ef109fab --node-labels "role=backend"

# eksctl utils associate-iam-oidc-provider --cluster cluster07 --approve

cd yamls 

kubectl apply -f be-service.yaml
kubectl apply -f fe-service.yaml
kubectl apply -f be-deployment.yaml 
kubectl apply -f fe-deployment.yaml 
kubectl apply -f redis-service.yaml
kubectl apply -f redis-deployment.yaml 

# #Configure IAM for EKS Loadbalancer if it doesnt already exist
# wget https://raw.githubusercontent.com/kura-labs-org/Template/main/iam_policy.json
# # aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam_policy.json

# #Create EKS service account that will create the load balancer
# eksctl create iamserviceaccount --cluster=cluster07 --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::994181039877:policy/AWSLoadBalancerControllerIAMPolicy --approve

# #Create resources in cluster
# kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml

# #Create resources for bulding load balancer
# # wget https://raw.githubusercontent.com/kura-labs-org/Template/main/v2_4_7_full.yaml

# #Download dependencies for ingress before applying the v2 yaml
# kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds"

#Apply the load balancer resources
kubectl apply -f v2_4_7_full.yaml 

kubectl apply -f ingress_class.yaml
kubectl apply -f ingress.yaml
