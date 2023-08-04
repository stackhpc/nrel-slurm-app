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

[compute]
%{ for compute in computes ~}
${compute.name} ansible_host=${[for n in compute.network: n.fixed_ip_v4 if n.access_network][0]} server_networks='${jsonencode({for net in compute.network: net.name => [ net.fixed_ip_v4 ] })}'
%{ endfor ~}

## Define groups for slurm parititions:
[${cluster_name}_lg]
${cluster_name}-xlg-001
${cluster_name}-xlg-002

[${cluster_name}_sm]
${cluster_name}-xsm-001
${cluster_name}-xsm-002
${cluster_name}-xsm-003
${cluster_name}-xsm-004

[${cluster_name}_gpu]
${cluster_name}-xgpu-001
${cluster_name}-xgpu-002
${cluster_name}-xgpu-003
${cluster_name}-xgpu-004
${cluster_name}-xgpu-005
${cluster_name}-xgpu-006
${cluster_name}-xgpu-007
${cluster_name}-xgpu-008
${cluster_name}-xgpu-009
${cluster_name}-xgpu-010
${cluster_name}-xgpu-011
${cluster_name}-xgpu-012
${cluster_name}-xgpu-013
${cluster_name}-xgpu-014
${cluster_name}-xgpu-015



# vt-lg-001: "large"
# vt-lg-002: "large"
# vt-sm-001: "small"
# vt-sm-002: "small"
# vt-gpu-001: "gpu"
