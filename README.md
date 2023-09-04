
# Useful Scripts
This is a collection of useful scripts which showcase some of my abilities 

## Self-hosted Kubernetes on VMs
| Name      | Description |
| ----------- | ----------- |
| [MultiPassKubernetesCluster](./Kubernetes/MultiPassKubernetesCluster) | Self hosted kubernetes cluster on mac with MultiPass |
| [Vagrant-Virtualbox-KubernetesCluster](./Kubernetes/Vagrant-Virtualbox-KubernetesCluster) | Self hosted kubernetes cluster on windows with Vagrant and virtualbox |
| [Local-Rancher-With-Vagrant](./Kubernetes/Local-Rancher-With-Vagrant) | Local Rancher with Vagrant |

## Terraform
| Name      | Description |
| ----------- | ----------- |
| [AWS Kubernetes Cluster with EKS](./Terraform/AWS-EKS-Cluster) | kubernetes cluster on AWS EKS with terraform |
| [VMware Vsphere VMs creation](./Terraform/VMware-vSphere-VMs-Creation) | kubernetes cluster on AWS EKS with terraform |
| [Rancher-vSphere](./Terraform/Rancher-vSphere) | Rancher cluster on vSphere |

## Continuous Delivery
| Name      | Description |
| ----------- | ----------- |
| [Bash-Simple-CD](./Continous-Deployment/Bash-Simple-CD) | Bash-Simple-CD | 
| [Powershell-Simple-CD](./Continous-Deployment/Powershell-Simple-CD) | Powershell-Simple-CD |




## Bash
| Name      | Description |
| ----------- | ----------- |
| [GetWordpressVersionForAllWebsites](./Bash/GetWordpressVersionForAllWebsites) | Bash script which outputs wordpress version information for each website in /var/www |
| [CreateCA+Script-to-create-self-signed-certificates-with-given-CA](./Bash/CreateCA+Script-to-create-self-signed-certificates-with-given-CA) | Tool for creating self signed certificates from own certificate authority |
| [F5-Redirects](./Bash/F5-Redirects/F5-Redirects) | example for script that changes a file with sed and awk |

## Active Directory
| Name      | Description |
| ----------- | ----------- |
| [ADPasswordExpiryReminder](./Powershell/ADPasswordExpiryReminder) | Active directory script which queries users' password expiry date and sends them an email 7,5,3,1 days before it's expiry |
| [ADDisableNeverLoggedInUsers](./Powershell/ADDisableNeverLoggedInUsers) | Active directory script which disables all users who have never logged in |
| [ADGenerateRandomPasswordForUsers.ps1](./Powershell/ADGenerateRandomPasswordForUsers.ps1) | Active directory script which generates a random password for all users from a list |
| [WindowsDeleteFilesOlderThan90Days.ps1](./Powershell/WindowsDeleteFilesOlderThan90Days.ps1) | short snippet to auto delete files in folder older than 90 days. To be used with Task Scheduler |
| [ADDisableUsersAndDeleteUsersAfter90Days](./Powershell/ADDisableUsersAndDeleteUsersAfter90Days) | disable users after 90 days of inactivity, delete users who are disabled for 90 days |
| [ADGetHotfixVersionForAllConnectedComputers](./Powershell/ADGetHotfixVersionForAllConnectedComputers) | get hotfix version for all connected computers to DC |
| [ADInstallMSIForAllComputers](./Powershell/ADInstallMSIForAllComputers) | Installs MSI for all computers in active domain] |
| [AD-GPO-ActivatePowershellRemortingAndCheck.ps1](./Powershell/AD-GPO-ActivatePowershellRemortingAndCheck.ps1) | create GPO to Activate powershell remoting and script to check if it's working |
| [ADCheckUsersInGroupAndNotify](./Powershell/ADCheckUsersInGroupAndNotify) | Check number of users in group and send email on condition |
| [ADGuiForUsersAndPasswords](./Powershell/ADGuiForUsersAndPasswords) | show users data in table |


