
## Requirement
* Helm
```
# install latest release
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

* Ansible collection
```
ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install cloud.common
```

## Usage
After modify `inventory.ini`:
```
ansible-playbook --private-key <ssh-key> -i inventory.ini layer-1.yml
```
