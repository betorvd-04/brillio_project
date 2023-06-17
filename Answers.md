## *GIT*
#### -  if you using git stash, where will it save data? What is diff b/w index and staging area?
Git stash saves data in a local temporary directory named .git/stash.
Index is persistent, before the changes were committed, and staging area is not persistent but the changes are already committed.

#### - when would individuals use git rebase, git fast-forward, or a git fetch then push?
Git rebase: I would use rebase to merge branches to create a cleaned history.
Git fast-forward: I would use it to merge branches by updating the branch to the tip of the other branch.
Git fetch then push: I would use it to update my local repo with a remote branch in the remote repo.

#### - How to revert already pushed changes?
There are two ways, Git Revert and Git Reset.
Git Revert: it creates a new commit and reverses the changes in the previous commit
Git Reset: it  will reset the local branch to a previous commit. This will discard all of the changes that you have made since the specified commit.

#### - What is the difference between cherry picking commits vs trying a hard reset. What is the final outcome of the head reference?
Cherry picking is the way to carry a commit from a branch to another without carrying all the changes in all the previous commits. Final outcome head is the commit we carried picked.
And, the hard reset reverses all the changes to an specific commit, removing all changes between the actual commit to the specified one on the same branch. Final outcome head is the specified commit.

#### - Explain the difference between git remote and git clone?
Git remote is used to reference a remote repository, we could track its changes and pull our own ones.
In the other hand, Git clone is used to literally clone a remote repository from a remote server to the local,
also we could track its changes and pull our own ones.


## *Terraform*

#### - What is the difference between terraform count and for_each meta data function? and give a scenario-based example to use them?
Count: takes a numerical value as input and creates that number of instances of the resource
for_each: takes a map or set of strings as input and creates one instance of the resource for each item in the map or set.
If I wanna create several indentical copies of an instance I could use count; but if not, If I wanna create my instances with different proprieties, I would use for_each.

#### - What is Terraform taint ? When to use it? When would you use terraform state rm vs terraform taint?
Taint: marks a resource hat terraform will destroy and recreate next time we run the “apply” command.
On the other hand, Terraform state rm removes a resource from the tfstate	this one is not gonna be mange by terraform.

#### - How would you show a diagram of all terraform resources in the state file? When is this useful?
Terraform graph is useful when we wanna have a better understanding of a infrastructure.

#### - Solve this expression:
> count = var.run_remote_environment ? var.TFC_RUN_ID !=["Yes"]) : null 

The !== operator is used to compare two values and return True if they are not equal.
In this case, we are comparing the value of the var.TFC_RUN_ID variable to the string "Yes".
If the values are not equal, we return 1, otherwise we return 0. Then:

> count = var.run_remote_environment ? var.TFC_RUN_ID != "Yes" : 0

#### - How would you apply terraform to multiple accounts simultaneously?
We want to ensure this follows secuirty best practices.
By using multiple provider feature in terraform, with different subscriptions ids, also using the assume role feature to set the access for each account,
then create multiple workspaces as well as multiple state files, one per subs_id.


## *GCP*

#### - What are different network connectivity options to connect from On-prem or another cloud to GCP ?
Cloud VPN: It encrypts all the traffic between the on prem network to GCP network, doing it secure and private.
Cloud interconnect: It uses a physical infrastructure to connect on prem network to gcp network, using high-bandwidth and low-latency.
Partner Interconnect: It connect GCP to a third-party service provider that it’s already connected to the on-prem network.
Direct Peering: It connects the on-prem network to GCP with the highest performance but it’s the most expensive.

#### - Where & how the FW rules are managed in GCP when using shared VPC architecture ?
There are in the host project, and they are manage by the Security Admins. They set the rule by specifying in addresses or ranges, using tags to groups instances together, as well as control access, and reviewing the FW rules often.

#### - How do you connect to GKE cluster from GCP cloudshell ?
There are two ways:
1- Using the cloud shell, and installing the Kubectl-command line tool “gcloud components install kubectl”, once it was installed we will get the credentials cluster by running “gcloud container clusters get-credentials CLUSTER_NAME”, and finally run command “kubectl cluster-info” to validate the cluster is already connected.
2- By using the GCP UI

#### - How is GCP VPC networking is different than AWS VPC networking ?
There are couple of key differences  between these Networking VPCs.
GCP VPC is global, and AWS VPC is regional.
GCP Subnets are zonal, and AWS subnets are not only zonal but contagious that means they could be multi zone.
GCP VPC uses firewall rules, and AWS VPC uses security groups to control the traffic.
Routing in GCP is automatic, but in AWS it must be explictly configured between the subnets.

#### - Explain high level steps to create a service project in GCP org with Shared VPC enabled ?
1. Become or be a part of the Organization Admins group.
2. Enable Shared VPC in the host project by using the GCP UI, going to Shared VPC, clicking on the Enable Host button, and follow the instruccions.
3. Become or be a part of the Shared VPC admins group.
4. Attach the service project to the host project going to Shared VPC, and clicking on the attached button to select the project we wanna be attached.
5. Grant the Service Project Admin role to users in the service project by going to the IAM & Admin page in the Google Cloud console and clicking on the Service project tab. Then, click on the Add members button and add the email addresses of the users that you want to grant the Service Project Admin role to.
6. Create resources in the service project as compute instances, and so on.
