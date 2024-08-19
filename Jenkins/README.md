# Jenkins Pipeline Job to Run K8s-Deployment
## 1. Access Jenkins through browser:  
- In the browser's address bar, enter `http://EC2_Public_IPv4_address:8080` and press Enter.
  
<img src="https://github.com/ZaynabMohammed/CI-CD-Project/blob/master/Jenkins/jenkins.PNG" width="900" height="620" >
## 2. Pipeline Job   
### Step 1:  
- Run a pipeline Job with below script, using below Repository, [https://github.com/ZaynabMohammed/K8s_Tasks.git](https://github.com/ZaynabMohammed/K8s_Tasks.git) .  
   
```bash
pipeline {
    agent any
	
    stages {
	    stage('Git') {
            steps {
                git 'https://github.com/ZaynabMohammed/K8s_Tasks.git'
            }
        }
        stage('Run deploy_nginx.yml') {
            steps {
                script {
                    dir('task1') {
                        sh '''
                           kubectl apply -f deploy_nginx.yml
                           kubectl apply -f service_nginx.yml
                        '''
                    }
                }
            }
        }
    }
}
```
### Step 2   
- Check that `Deployment` and `service` are running inside EC2_instance
  
   1. SSH into EC2-Instance using below command.
      
   ```bash
    $ ssh -i EC2_key.pm ubuntu@EC2_Public_IPv4_address
   ```
   2. Switch user to jenkins, so that you can deal with cluster  
      
   ```bash
    $ sudo su - jenkins
   ```
   3. Using `kubectl` to get `Pods`, `Deployment`, `replicaset`  and `service`
      
   ```bash
    $ kubectl get all
    NAME                                    READY   STATUS    RESTARTS   AGE
    pod/nginx-deployment-694f765b8d-6hl6b   1/1     Running   0          74m
    pod/nginx-deployment-694f765b8d-9fn88   1/1     Running   0          74m
    pod/nginx-deployment-694f765b8d-vh8wd   1/1     Running   0          74m

    NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
    service/kubernetes      ClusterIP   10.96.0.1      <none>        443/TCP        93m
    service/nginx-service   NodePort    10.110.229.0   <none>        80:30001/TCP   54m

    NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/nginx-deployment   3/3     3            3           74m

    NAME                                          DESIRED   CURRENT   READY   AGE
    replicaset.apps/nginx-deployment-694f765b8d   3         3         3       74m
   ```   
