compute_types = {
  large: {
    flavor: "test.compute.c60m240s8e1k"
    image: "vs_rocky86_20221231"
  }
  standard: {
    flavor: "test.compute.c30m120s60e5000"
    image: "vs_rocky86_20221231"
  }
  small: {
    flavor: "test.compute.c8m32s8e60"
    image: "vs_rocky86_20221231"
  }
  tiny: {
    flavor: "test.compute.c4m16s8e60"
    image: "vs_rocky86_20221231"
  }
  gpu: {
    flavor: "test.gpu.c30m120s16e5000"
    image: "vs_rocky86_20221231"
  }
}
#######################################
compute_names = {
# Node-inventory.txt
vtest-lg-001: "large"
vtest-lg-002: "large"
vtest-sm-001: "small"
vtest-sm-002: "small"
vtest-gpu-001: "gpu"
vtest-gpu-002: "gpu"
vtest-gpu-003: "gpu"
vtest-gpu-004: "gpu"
vtest-gpu-005: "gpu"
vtest-gpu-006: "gpu"
vtest-gpu-007: "gpu"
vtest-gpu-008: "gpu"
vtest-gpu-009: "gpu"
vtest-gpu-010: "gpu"
vtest-gpu-011: "gpu"
vtest-gpu-012: "gpu"
vtest-gpu-013: "gpu"
vtest-gpu-014: "gpu"
vtest-gpu-015: "gpu"
}

###################################################

#---- login node info ----
# name: flavor
login_names = {
  vtest-login-1: "test.gen.c8m16s16"
  vtest-admin: "test.gen.c8m16s16"
}
# name: IPaddr
login_ips = {
  vtest-login-1: "10.60.107.241"
  vtest-admin: "10.60.107.243"
}
login_image = "vs_rocky86_20221231"
login_flavor = "test_admin_c8m16s16"
# login_flavor = "test.gen.c8m16s16"
#---- /login ----

proxy_name = "vtest-admin"

#---- CONTROL node info ----
control_image = "vs_rocky86_20221231"
# control_flavor = "test.gen.c8m16s16"
control_flavor = "test_admin_c8m16s16"
control_ip = "10.60.107.240"

###################################################

cluster_name  = "vtest"
cluster_slurm_name = "vtest"
cluster_availability_zone = "esif"

# don't put dashes (creates invalid ansible group names) or underscores (creates hostnames which get mangled) in this

key_pair = "slurmdeploy"

external_network = "external"
cluster_network = "compute"
cluster_subnet = "compute-subnet"

storage_network = "storage"
storage_subnet = "storage-subnet"

control_network = "control"
control_subnet = "control-subnet"

##compute_image = "rocky8.5_ofed+cuda"
##compute_image = "gpu_2021_11_12"

###########  ^^^^^^^^^^^^^^^ CHANGE THIS
##compute_images = {} # allows overrides for specific nodes, by name
compute_images = {}

#openstack port create --network external --fixed-ip subnet=external,ip-address=10.60.107.240 vtest_control_port
#openstack port create --network external --fixed-ip subnet=external,ip-address=10.60.107.241 vtest_login1_port
