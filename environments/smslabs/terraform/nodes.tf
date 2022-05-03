data "openstack_images_image_v2" "control" {
  name = var.control_node.image
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "user-data"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/init.tpl",
                                {
                                  state_dir = var.state_dir
                                }
                              )
  }
}

resource "openstack_compute_instance_v2" "control" {
  
  name = "${var.cluster_name}-control"
  image_name = data.openstack_images_image_v2.control.name
  flavor_name = var.control_node.flavor
  key_pair = var.key_pair
  config_drive = true
  security_groups = ["default", "ssh"]

  # root device:
  block_device {
      uuid = data.openstack_images_image_v2.control.id
      source_type  = "image"
      destination_type = "local"
      boot_index = 0
      delete_on_termination = true
  }

  # state volume:
  block_device {
      destination_type = "volume"
      source_type  = "volume"
      boot_index = -1
      uuid = openstack_blockstorage_volume_v3.control.id
  }

  network {
    uuid = data.openstack_networking_subnet_v2.cluster_subnet.network_id # ensures nodes not created till subnet created
    access_network = true
  }

  metadata = {
    environment_root = var.environment_root
  }

  user_data = data.template_cloudinit_config.config.rendered

}

resource "openstack_compute_instance_v2" "login" {

  for_each = var.login_nodes
  
  name = "${var.cluster_name}-${each.key}"
  image_name = each.value.image
  flavor_name = each.value.flavor
  key_pair = var.key_pair
  config_drive = true
  security_groups = ["default", "ssh", "HTTPS"]

  network {
    uuid = data.openstack_networking_subnet_v2.cluster_subnet.network_id
    access_network = true
  }

  metadata = {
    environment_root = var.environment_root
  }

}

resource "openstack_compute_instance_v2" "compute" {

  for_each = var.compute_nodes
  
  name = "${var.cluster_name}-${each.key}"
  image_name = lookup(var.compute_images, each.key, var.compute_types[each.value].image)
  flavor_name = var.compute_types[each.value].flavor
  key_pair = var.key_pair
  config_drive = true
  security_groups = ["default", "ssh"]

  network {
    uuid = data.openstack_networking_subnet_v2.cluster_subnet.network_id
    access_network = true
  }

  metadata = {
    environment_root = var.environment_root
  }

}
