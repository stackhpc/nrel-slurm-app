compute_types = {
  large: {
    flavor: "compute.c60m240s120e1000"
    image: "rocky8.5_ofed+cuda"
  }
  standard: {
    flavor: "compute.c30m120s60e500"
    image: "rocky8.5_ofed+cuda"
  }
  small: {
    flavor: "compute.c16m64s32e250"
    image: "rocky8.5_ofed+cuda"
  }
  tiny: {
    flavor: "compute.c4m16s8e60"
    image: "rocky8.5_ofed+cuda"
  }
  gpu: {
    flavor: "gpu.c30m120s32e6000"
    image: "rocky8.5_ofed+cuda+driver"
  }
}

compute_names = {
# Node-inventory.txt

lg-0001: "large"
lg-0002: "large"
lg-0003: "large"
lg-0004: "large"
lg-0005: "large"
lg-0006: "large"
lg-0007: "large"
lg-0008: "large"
lg-0009: "large"
lg-0010: "large"
lg-0011: "large"
lg-0012: "large"
lg-0013: "large"
lg-0014: "large"
lg-0015: "large"
lg-0016: "large"
lg-0017: "large"
lg-0018: "large"

std-0001: "standard"
std-0002: "standard"
std-0003: "standard"
std-0004: "standard"
std-0005: "standard"
std-0006: "standard"
std-0007: "standard"
std-0008: "standard"
std-0009: "standard"
std-0010: "standard"
std-0011: "standard"
std-0012: "standard"
std-0013: "standard"
std-0014: "standard"
std-0015: "standard"
std-0016: "standard"
std-0017: "standard"
std-0018: "standard"
std-0019: "standard"
std-0020: "standard"
std-0021: "standard"
std-0022: "standard"
std-0023: "standard"
std-0024: "standard"
std-0025: "standard"
std-0026: "standard"
std-0027: "standard"
std-0028: "standard"
std-0029: "standard"
std-0030: "standard"
std-0031: "standard"
std-0032: "standard"
std-0033: "standard"
std-0034: "standard"
std-0035: "standard"
std-0036: "standard"
std-0037: "standard"
std-0038: "standard"
std-0039: "standard"
std-0040: "standard"
std-0041: "standard"
std-0042: "standard"
std-0043: "standard"
std-0044: "standard"
std-0045: "standard"
std-0046: "standard"
std-0047: "standard"
std-0048: "standard"
std-0049: "standard"
std-0050: "standard"
std-0051: "standard"
std-0052: "standard"
std-0053: "standard"
std-0054: "standard"
std-0055: "standard"
std-0056: "standard"
std-0057: "standard"
std-0058: "standard"
std-0059: "standard"
std-0060: "standard"
std-0061: "standard"
std-0062: "standard"

sm-0001: "small"
sm-0002: "small"
sm-0003: "small"
sm-0004: "small"
sm-0005: "small"
sm-0006: "small"
sm-0007: "small"
sm-0008: "small"
sm-0009: "small"
sm-0010: "small"
sm-0011: "small"
sm-0012: "small"
sm-0013: "small"
sm-0014: "small"
sm-0015: "small"
sm-0016: "small"
sm-0017: "small"
sm-0018: "small"
sm-0019: "small"
sm-0020: "small"
sm-0021: "small"
sm-0022: "small"
sm-0023: "small"
sm-0024: "small"
sm-0025: "small"
sm-0026: "small"
sm-0027: "small"
sm-0028: "small"
sm-0029: "small"
sm-0030: "small"
sm-0031: "small"
sm-0032: "small"

t-0001: "tiny"
t-0002: "tiny"
t-0003: "tiny"
t-0004: "tiny"
t-0005: "tiny"
t-0006: "tiny"
t-0007: "tiny"
t-0008: "tiny"
t-0009: "tiny"
t-0010: "tiny"
t-0011: "tiny"
t-0012: "tiny"
t-0013: "tiny"
t-0014: "tiny"
t-0015: "tiny"

gpu-0001: "gpu"
gpu-0002: "gpu"
gpu-0003: "gpu"
gpu-0004: "gpu"
gpu-0005: "gpu"
gpu-0006: "gpu"
}

##########################################

login_names = {
  login-1: "gen.c8m16s16"
  login-2: "gen.c8m16s16"
  admin:   "gen.c8m16s16"
}
#

login_ips = {
  login-1: "10.60.105.223"
  login-2: "10.60.106.225"
   admin: "10.60.105.50"
}
#

login_image = "rocky8.5_ofed+cuda"

proxy_name = "login-1"

control_image = "rocky8.5_ofed+cuda"
control_flavor = "gen.c16m32s32"
control_ip = "10.60.106.230"

#######################################

cluster_name  = "vs"
cluster_slurm_name = "vermilion"
cluster_availability_zone = "vermilion-az1"

# don't put dashes (creates invalid ansible group names) or underscores (creates hostnames which get mangled) in this

key_pair = "slurmdeploy"

external_network = "external"
cluster_network = "compute"
cluster_subnet = "compute-subnet"

storage_network = "storage"
storage_subnet = "storage"

control_network = "control"
control_subnet = "control-subnet"

#compute_image = "rocky8.5_ofed+cuda"
#compute_image = "gpu_2021_11_12"
###########  ^^^^^^^^^^^^^^^ CHANGE THIS
#compute_images = {} # allows overrides for specific nodes, by name
compute_images = {}

# reserve ports for the above:
#openstack port create --network external --fixed-ip subnet=external,ip-address=10.60.107.240 vtest_control_port
#openstack port create --network external --fixed-ip subnet=external,ip-address=10.60.107.241 vtest_login1_port
