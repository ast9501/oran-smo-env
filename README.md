# O-RAN SMO Environment Repo
## Description
This project used to setup O-RAN SMO platform with opensource Core Network, Transport Network and Access Network solution.
The opensource projects in testbed:
- 5G, O-RAN related
  - Core Network
    - [free5GC](https://github.com/free5gc/free5gc)
  - Transport Network
    - mininet
    - [ONOS](https://github.com/opennetworkinglab/onos)
  - Access Network
    - [ONAP-based SMO]()
    - [OpenAirInterface, OAI](https://openairinterface.org/)

![image](https://user-images.githubusercontent.com/90389266/212096013-409140a6-e857-466a-ac9e-fee9fd6d7b9a.png)

The instances:
- Management Node
  - OS: Ubuntu 20.04-server
  - Core: 2
  - RAM: 8Gi
  - Disk: 32Gi
  
- SMO Node
  - OS: Ubuntu 20.04-server
  - Core: 10
  - RAM: 32Gi
  - Disk: 64Gi

- OAI Node
  - OS: Ubuntu 18.04-server
  - Core: 4
  - RAM: 8Gi
  - Disk: 64Gi

# Usage
## Requirement
- Terraform
- direnv
- an openstack cluster ready to deploy instances

Copy your `openrc` to root directory, and also rename it:
```
cp ~/openrc localrc
```

## Deploy instances (layer-0)
Before using terraform to create instnaces, create an new openstack project first:
* Create `oran` project
```
source localrc
openstack project create oran
openstack role add --user admin --project oran admin
```

* Modify localrc with new project name
```
# localrc
...
OS_PROJECT_NAME=oran
OS_TENANT_NAME=oran
...
```

```
source localrc
```

* Create private key used to login to VMs 
```
ssh-keygen
<Enter>
<Enter>
<Enter>
```

* into terraform directory
```
cd terraform/
```

Copy public-key to `keypair.tf` 
```
# keypair.tf
resource "openstack_compute_keypair_v2" "oran-keypair" {
  name       = "oran-keypair"
  // insert your own public key
  public_key = ""
}
```

* Init and apply terraform
```
terraform init
terraform apply
```

## Setup platform (layer-1)
* Requirements
```
ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install cloud.common
```

### Management Node
```
cd playbooks/
vim inventory.ini
```

Update the instances info (ip)

* run playbooks
```
ansible-playbook --private-key <ssh-key> -i inventory.ini layer-1.yml
```

# Project Status
## In Terraform parts
Since we don't have enough compute on single OpenStack Cluster, we mark up the central node instance (also related OpenStack resource). 
