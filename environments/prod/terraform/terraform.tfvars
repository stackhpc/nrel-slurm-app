compute_types = {
  large: {
    flavor: "compute.c60m240s120e1000"
    image: "vs_rocky86_20221231"
  }
  standard: {
    flavor: "compute.c30m120s60e500"
    image: "vs_rocky86_20221231"
  }
  small: {
    flavor: "compute.c16m64s32e250"
    image: "vs_rocky86_20221231"
  }
  tiny: {
    flavor: "compute.c4m16s8e60"
    image: "vs_rocky86_20221231"
  }
  gpu: {
    flavor: "gpu.c30m120s32e6000"
    image: "vs_rocky86_20221231"
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
lg-0019: "large"
lg-0020: "large"
lg-0021: "large"
lg-0022: "large"
lg-0023: "large"
lg-0024: "large"
lg-0025: "large"
lg-0026: "large"
lg-0027: "large"
lg-0028: "large"
lg-0029: "large"
lg-0030: "large"
lg-0031: "large"
lg-0032: "large"
lg-0033: "large"
lg-0034: "large"
lg-0035: "large"
lg-0036: "large"
lg-0037: "large"
lg-0038: "large"
lg-0039: "large"


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
gpu-0007: "gpu"
gpu-0008: "gpu"
gpu-0009: "gpu"
gpu-0010: "gpu"
gpu-0011: "gpu"
gpu-0012: "gpu"
gpu-0013: "gpu"
gpu-0014: "gpu"
gpu-0015: "gpu"
gpu-0016: "gpu"
gpu-0017: "gpu"

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

login_image = "vs_rocky86_20221231"
login_flavor = "vermilion_util_c8m15"


control_image = "vs_rocky86_20221231"
control_flavor = "vermilion_util_c8m15"

control_ip = "10.60.106.230"

proxy_name = "login-1"

#######################################

cluster_name  = "vs"
cluster_slurm_name = "vermilion"
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


###########  ^^^^^^^^^^^^^^^ CHANGE THIS
#compute_images = {} # allows overrides for specific nodes, by name
compute_images = {}

# reserve ports for the above:
#openstack port create --network external --fixed-ip subnet=external,ip-address=10.60.107.240 vtest_control_port
#openstack port create --network external --fixed-ip subnet=external,ip-address=10.60.107.241 vtest_login1_port