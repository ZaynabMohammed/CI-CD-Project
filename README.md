# CI-CD-Project

<div style="display: flex; justify-content: space-between; align-items: center;">
  <img src="https://www.vectorlogo.zone/logos/ansible/ansible-ar21.svg"; alt="Ansible" width="110" height="130">
  <img src="https://www.vectorlogo.zone/logos/terraformio/terraformio-ar21.svg"; alt="Terraform" width="100" height="100">
  <img src="https://www.vectorlogo.zone/logos/docker/docker-official.svg"; alt="Docker" width="100" height="100">
  <img src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-ar21.svg"; alt="Kubernetes" width="150" height="130">
  <img src="https://www.vectorlogo.zone/logos/amazon_aws/amazon_aws-ar21.svg"; alt="AWS" width="100" height="100">
  <img src="https://www.vectorlogo.zone/logos/jenkins/jenkins-ar21.svg"; alt="Jenkins" width="100" height="100">
</div>

## In this Repo:  
-----------------
1. Create an `EC2_Instance` with `Terraform`.
  
2. Configure this `EC2_Instance` with `Ansible`, to setup `jenkins`,`Docker`,`Minikube`,`Kubectl` on it.
-   `playbook-docker.yml`: Ansible-playbook to configure Docker on EC2.
-   `playbook-jenkins.yml`: Ansible-playbook to configure Jenkins on EC2.
-   `playbook-minikube.yml`: Ansible-playbook to configure Minikube & Kubectl on EC2.
-   `playbook.yml`: Ansible-playbook to make sure that jenkins can use docker & K8s Cluster.  
  
3. Create a `pipeline` Job within `Jenkins` to orchestrate the deployment of Nginx application onto `K8s-cluster`.  
