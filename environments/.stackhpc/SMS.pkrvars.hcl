flavor = "general.v1.tiny"
networks = ["26023e3d-bc8e-459c-8def-dbd47ab01756"] # stackhpc-ipv4-geneve
source_image_name = "openhpc-230503-0944-bf8c3f63" # https://github.com/stackhpc/ansible-slurm-appliance/pull/252
fatimage_source_image_name = "Rocky-8-GenericCloud-Base-8.8-20230518.0.x86_64.qcow2"
ssh_keypair_name = "slurm-app-ci"
ssh_private_key_file = "~/.ssh/id_rsa"
security_groups = ["default", "SSH"]
ssh_bastion_host = "185.45.78.150"
ssh_bastion_username = "steveb"