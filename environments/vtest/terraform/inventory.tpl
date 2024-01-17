[all:vars]
ansible_user=rocky
openhpc_cluster_name=${cluster_name}
ansible_ssh_common_args='-o ProxyCommand="ssh rocky@${proxy_fip} -W %h:%p"'

[control]
${control.name} ansible_host=${[for n in control.network: n.fixed_ip_v4 if n.access_network][0]} server_networks='${jsonencode({for net in control.network: net.name => [ net.fixed_ip_v4 ] })}'

[admin]
${cluster_name}-admin

[login]
%{ for login in logins ~}
${login.name} ansible_host=${[for n in login.network: n.fixed_ip_v4 if n.access_network][0]} server_networks='${jsonencode({for net in login.network: net.name => [ net.fixed_ip_v4 ] })}'
%{ endfor ~}

[compute: children]
compute_all
compute_lg
compute_lg_intel
compute_std
compute_sm
compute_t
compute_gpu0
compute_gpu3

[compute_gpu: children]
compute_gpu
compute_gpu3

[compute_all]
%{ for compute in computes ~}
${compute.name} ansible_host=${[for n in compute.network: n.fixed_ip_v4 if n.access_network][0]} server_networks='${jsonencode({for net in compute.network: net.name => [ net.fixed_ip_v4 ] })}'
%{ endfor ~}

[compute_lg]
## Define groups for slurm parititions:
[${cluster_name}_lg]
${cluster_name}-vtlg-[001:002]

[${cluster_name}_lg_intel]
${cluster_name}-vtlg-intel-001

[compute_std]
#

[compute_sm]
#
[${cluster_name}_sm]
#

[compute_t]
#
[${cluster_name}_t]
#
[compute_gpu]
# partition vs capability? Flavor issue with different sizes of RAM.

[${cluster_name}_gpu]
${cluster_name}-vtgpu-[001:002]

[compute_gpu3]
#
[${cluster_name}_gpu3]
${cluster_name}-vtgpu3-[001:002]

