# create Linux Vm using terraform
# Create inventory.ini and update.yml file
# WINRM (wsl) -Login Ubuntu 
# Install ansible -->sudo apt update  , sudo apt install ansible -y
# Change directory to ansible files path ---> cd /mnt/e/Terraform-projects/vm-ansible 
# Test ping the host machine ----> ansible -i inventory.ini azure_vm -m ping
# if ssh files not secured then move into home/user path and change the permissions of ssh files
# Test remote machine local -----> ssh -i ~/.ssh/id_rsa azureuser@<ip-address>   (it will enter into remote machine)
# Update ansible inventory file based on that. --> 
    [azure_vm]
    <host-ip> ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa
# Change into folder path -- cd /mnt/e/Terraform-projects/vm-ansible 
# Now test again ---> ansible -i inventory.ini azure_vm -m ping
# Now run ansible play book ---> ansible-playbook -i inventory.ini update.yml
# create again docker-install.yaml and run ansible-playbook command
--------------------
Promethous & Graffana installation:
# Make sure Node Exporter is already installed and running on the same VM before Prometheus starts.
# create node_Exporter yml file
# ansible-playbook -i inventory.ini node_Exporter.yml
# Check after installed by ps aux | grep node_exporter

# Create promethe.yml for prometheous installation
# ansible-playbook -i inventory.ini promethe_install.yml
# check by ---> sudo systemctl status prometheus
#          ----> http://<azure_vm_public_ip>:9090

# Create grafana_install.yml for graffana installation
# ansible-playbook -i inventory-ini graffana_install.yml
# chek by ---> sudo systemctl status grafana-server
#       -----> http://<VM_Public_IP>:3000

