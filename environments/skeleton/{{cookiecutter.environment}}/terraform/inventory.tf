resource "local_file" "hosts" {
  content  = templatefile("${path.module}/inventory.tpl",
                          {
                            "cluster_name": var.cluster_name,
                            "cluster_domain_suffix": var.cluster_domain_suffix,
                            "control_instances": openstack_compute_instance_v2.control
                            "login_instances": openstack_compute_instance_v2.login
                            "compute_instances": openstack_compute_instance_v2.compute
                            "state_dir": var.state_dir,
                            "compute_types": var.compute_types,
                            "compute_nodes": var.compute_nodes,
                          },
                          )
  filename = "../inventory/hosts"
}

resource "local_file" "partitions" {
    content  = templatefile("${path.module}/partitions.tpl",
                            {
                              "compute_types": var.compute_types,
                            },
    )
    filename = "../inventory/group_vars/all/partitions.yml" # as all/ is created by skeleton
}
