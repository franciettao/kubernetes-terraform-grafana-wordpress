#!/bin/bash

# Install kubeadm, kubelet, and kubectl
sudo apt-get update && sudo apt-get install -y kubelet kubeadm kubectl

# Initialize Kubernetes master
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# Set up kubeconfig for the user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy a network plugin (e.g., Calico)
kubectl apply -f https://docs.projectcalico.org/v3.19/manifests/calico.yaml
