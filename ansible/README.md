# Using Ansible-playbooks to configure EC2-Instance
----------------------------------------------------
1- Get `instance_public_ip` from terraform output to add it in inventory && use `EC2_key.pem` to ssh into Ec2-Instance.
```bash
EC2_Server ansible_host=instance_public_ip ansible_ssh_private_key_file=../terraform/EC2_key.pem
```
2- Run ansible `playbook-docker.yml` to configure docker inside Ec2-Instance.
```bash
$ ansible-playbook playbook-docker.yml
PLAY [Setup Docker on ubuntu] ******************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [EC2_Server]

TASK [Install curl package] ********************************************************************************************************************************************
changed: [EC2_Server]

TASK [Add Docker GPG key to trusted keys] ******************************************************************************************************************************
changed: [EC2_Server]

TASK [Add Docker repository using add-apt-repository module] ***********************************************************************************************************
changed: [EC2_Server]

TASK [Update apt package cache again after adding Docker repository] ***************************************************************************************************
changed: [EC2_Server]

TASK [Install required packages for Docker installation] ***************************************************************************************************************
changed: [EC2_Server]

TASK [Install Docker] **************************************************************************************************************************************************
changed: [EC2_Server]

TASK [Add the current user to the docker group] ************************************************************************************************************************
changed: [EC2_Server]

TASK [Start and enable Docker service] *********************************************************************************************************************************
ok: [EC2_Server]

PLAY RECAP *************************************************************************************************************************************************************
EC2_Server                 : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
````
3- Run ansible `playbook-jenkins.yml` to configure jenkins inside Ec2-Instance.
```bash
$ ansible-playbook playbook-jenkins.yml
PLAY [Setup Jenkins] ***************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [EC2_Server]

TASK [Download Jenkins keyring] ****************************************************************************************************************************************
changed: [EC2_Server]

TASK [Add Jenkins repository to sources list] **************************************************************************************************************************
changed: [EC2_Server]

TASK [Install fontconfig and openjdk-17-jre] ***************************************************************************************************************************
changed: [EC2_Server]

TASK [Update apt package cache] ****************************************************************************************************************************************
changed: [EC2_Server]

TASK [Install Jenkins package] *****************************************************************************************************************************************
ok: [EC2_Server]

TASK [Start jenkins Service] *******************************************************************************************************************************************
changed: [EC2_Server]

PLAY RECAP *************************************************************************************************************************************************************
EC2_Server                 : ok=7    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
4- Run ansible `playbook-minikube.yml` to configure minikube & kubectl inside Ec2-Instance.
```bash
$ ansible-playbook playbook-minikube.yml
PLAY [Install Minikube and kubectl] ************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [EC2_Server]

TASK [Download Minikube Debian] ****************************************************************************************************************************************
changed: [EC2_Server]

TASK [Install Minikube Debian] *****************************************************************************************************************************************
changed: [EC2_Server]

TASK [Download kubectl] ************************************************************************************************************************************************
changed: [EC2_Server]

PLAY RECAP *************************************************************************************************************************************************************
EC2_Server                 : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
5- Run ansible `playbook.yml` to Enable `jenkins` user to use docker & K8s Cluster.
```bash
$ ansible-playbook playbook.yml

PLAY [Enable jenkins to use docker & minikube] ***********************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************
ok: [EC2_Server]

TASK [Add Jenkins user to Docker group] ******************************************************************************************************************
changed: [EC2_Server]

TASK [Ensure Jenkins user can run Docker commands without sudo] ******************************************************************************************
changed: [EC2_Server]

TASK [Start Minikube with jenkins user] ******************************************************************************************************************
changed: [EC2_Server]

PLAY RECAP ***********************************************************************************************************************************************
EC2_Server                 : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
6- Check that everything is running inside EC2-Instance.  

1. Access Jenkins through browser.
- In the browser's address bar, enter `http://EC2_Public_IPv4_address:8080` and press Enter.

2. Switch to jenkins user & Check that minikube is up based on docker driver.
```bash
$ docker images
REPOSITORY       TAG       IMAGE ID       CREATED        SIZE
kicbase/stable   v0.0.44   5a6e59a9bdc0   3 months ago   1.26GB
```
3. Check minikube status.
```bash
$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
