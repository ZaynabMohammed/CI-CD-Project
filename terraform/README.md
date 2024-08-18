# Create Ubuntu EC2 on AWS using Terraform
1. Intsall Terraform CLI
```bash
$ wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
$ unzip terraform_0.13.0_linux_amd64.zip
$ mv terraform /usr/local/bin
$ terraform version
```
2. Intsall AWS CLI
```bash
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws --version
```
3. Configure IAM user credentials
```bash
$ aws configure
AWS Access Key ID [None]: .....
AWS Secret Access Key [None]: .....
Default region name [None]: .....
Default output format [None]: ....
```
4. Create providers.tf file
```bash
# Which containes the provider information
```
5. Create main.tf file
```bash
# That containes the resources that you will build ex: EC2 instence specs
```
6. Create security.tf file
```bash
# That containes the security group attached to the ec2 instence 
# Also the keypair that will be used to connect on the ec2 instence
```
7. Create variables.tf file
```bash
# That containes all the variables with the data that you should not expose to public
```
9. Run terraform commands to pull plugins of provider and apply infrastructure.
```bash
$ terraform init
$ terraform plan
$ terraform apply   
```
   
   
