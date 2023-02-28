# test-retargely
test for retargely

# DevOps Challenge

## Index

* [Instructions](#instructions)
* [Proposed Architecture](#proposed-architecture)
* [Terraform Plan](#terraform-plan-terratest)
* [CICD - Automation](#cicd-automation-bonus)
* [Observability](#observability-bonus)
* [Permissions](#permissions-bonus)
* [Best Practices](#best-practices-bonus)
* [Disaster Recovery Plan](#disaster-recovery-plan-bonus)
* [Compliance](#compliance-bonus)
* [Budget](#budget-bonus)


## Instructions

<details>
<summary><b>Test Details</b></summary>

---

## ⚙️ Task
Imagine the following scenario, your company is growing quickly 🚀 and increasing the number services being deployed and configured.
It's been noticed that the code in `tf/main.tf` is not very easy to maintain 😢.

We would like you to complete the following tasks:

- [ ] Improve the Terraform code to make it easier to add/update/remove services
- [ ] Add a new environment called `staging` that runs each microservice
- [ ] Add a README detailing: 
  - [ ] Your design decisions, if you are new to Terraform let us know
  - [ ] How your code would fit into a CI/CD pipeline
  - [ ] Anything beyond the scope of this task that you would consider when running this code in a real production environment

</details>


## Questions
<details>
<summary><b>How would you format your terraform code to make it reusable, and repetable?</b></summary>

---
With Terraform, you can put your code inside of a Terraform module and reuse that module in multiple places throughout your code. Instead of having the same code copied and pasted in the staging and production environments, and also we will convine it with the use of Workspaces and CICD
</details>

<details>
<summary><b>How your code would fit into a CI/CD pipeline</b></summary>

---
The CICD process will levarage different environments using a Gitflow operation
</details>

<details>
<summary><b>What values ​​of the resources would you monitor?</b></summary>

---
XXXX
</details>

<details>
<summary><b>What values ​​would you put an alert on?</b></summary>

---
We will define alarm/threshold for     
```
```

</details>

<details>
<summary><b>With what tool and how would you implement the monitoring/alerts.</b></summary>

---
We are going to deploy monitoring and alerts with Cloudwatch that is integrated , all will be deployed using terraform.
</details>

## FAQ

The goal of this test is to reformat the terraform code for local use but if we considered moving to a best production option here is the proposal.

## Proposed Architecture

As stated, this test is only for local use, but the next logical iteration will be to make it cloud based.

Some changes will be.

* Using Terraform workspaces to standarize the environments and using the branch as terraform state isolation
* Adding Alerting (Cloudwatch)
* using a Vault Cluster (AWS ASG)

The following is ***a proposal***. Therefore, the infrastructure may have the required resources and correlation between them, but is in no way ready for usage.

### Overview
Vault is a good fit for a few use cases. The main one we are looking at is for a running application. This solves a few problems:

* It protects agains the insider threat of rogue admins/operators abusing DB credentials. This is a hard issue to solve in traditional ways and in the end the mitigation comes down to auditing DB logs for unusual activity. That is obviously a bit late because the damage has already been done by the time you look at the logs..
* It automates credential rotation, making it easy to comply with your crypto key management best practises
* It removes the need to store credentials in potentially insecure config files or similar

![alt text](/images/proposed_diagram.png "Proposed diagram")

The proposed solution performs the following acctions. 
```
1. Deploys a VPC with a public and private layer
2. API GW will be directly forwarding the data to a Lambda.
3. Lambda will retrieve the information of a file stored in a s3 bucket. 
```
## Requirements

* An active AWS account
* AWS Keys
* Terraform => https://learn.hashicorp.com/tutorials/terraform/install-cli
* AWS CLI => https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Constrains

* CICD account with AWS privileges to run Terraform
* Secrets stored in the Github repository in order to the pipeline to dont fail
* Local environment (.env) vars for test deployment

# Process for local testing

1. Use the `env.template` file to create the `.env` file.
2. Populate the `.env` file with your AWS access KEYs and selected Region.
3. Execute `source .env`.
4. Change Backend to `local {}`
5. Execute `terraform init`
6. Execute `terraform plan`

## Terraform plan / Terratest

<details>
<summary>Summary</summary>
  
```

```
</details>

## Cloud Native Vault

In the next iteration, the proposed architecture will have the key concepts:

* If the Vault fails, any dependent application fails too, so we need a multi AZ and multi-server in each AZ
* The storage backend must also support HA (DynamoDB)
* The MySQL secret backend generates credentials on the fly so it needs access to the DB. We can use VPG Gateways to lock down access to the DB
* Security is placed with AWS EC2 Auth backend so that we can make use of IAM roles to control access to the Vault
For better isolation and defense-in-depth, the architecture supports applications in different AWS accounts and the Vault servers in yet another AWS account

```


```

## Testing Service

```  

```



## Observability

We will consider the following metrics
```
* Scalability
* Reliability
* Availability
* Latency
* Fexibility 
```
## Monitoring and Alerting

We will use Cloudwatch to monitor the services

Key metrics for monitoring
```
1. 5XX Error
2. 4XX Error
3. Service health status.
```
## CICD Automation

![alt text](/images/cicd.png "CICD")

Using a CI/CD tool (i.e. Github Actions) 
```
1. The CICD will review the Code using Sonarqube/Chekcov.
2. Using the Terraform Github Actions functions will run the terraform fmt/ validate/ plan.
3. The CICD will publish the terraform plan in the PR
4. We will use a Gitflow Structure for different environment leveraging with Terarform Workspaces
5. After the PR gets merged to master the CICD will run the Terraform Apply
```

## Terraform and Secrets

Terraform reads the value for its variables from environment. The next piece is to translate the GitHub secret in an environment variable.

In practice, if your Terraform script has a variable declaration like

```
variable "my_public_key" {}
and you have a GitHub secret PUBKEY, then you can use this syntax in your workflow

steps:
  - run: terraform apply -auto-approve
    env:
      TF_VAR_my_public_key: ${{ secrets.PUBKEY }}
```

## Permissions 

All infrastructure authentication is controlled by IAM Roles. 

We will use the principle of Least Priviledge 
```
1. AWS EC2 Auth backend so that we can make use of IAM roles to control access to the Vault
2. We recommend that we avoid placing secrets in your Terraform config, we will use Github Secrets
3. Bussiness Logic will be deployed in the private layer
```

## Calculation Report
![alt text](/images/estimate.png "AWS price estimation")

The above was generated using https://calculator.aws/#/.  Is an approximation for heavy usage on the 100 million requests per month. 




