compute_names = {
  lg-0001: "compute.c64m240s128e1000"
  lg-0002: "compute.c64m240s128e1000"

  std-0001: "compute.c32m120s64e500"
  std-0002: "compute.c32m120s64e500"

  sm-0001: "compute.c16m60s32e250"
  sm-0002: "compute.c16m60s32e250"

  t-0001: "compute.c4m15s16e125"
  t-0002: "compute.c4m15s16e125"

  gpu-0001: "gpu.c8m30s32e500"

}
login_names = {
  login-1: "gen.c8m15"
  login-2: "gen.c8m15"
}

proxy_name = "login"

cluster_name  = "vs" # don't put dashes (creates invalid ansible group names) or underscores (creates hostnames which get mangled) in this
key_pair = "slurmdeploy"

external_network = "external"
cluster_network = "compute"
cluster_subnet = "compute-subnet"

storage_network = "storage"
storage_subnet = "storage"

control_network = "control"
control_subnet = "control-subnet"

login_image = "CentOS8.3"
control_image = "CentOS8.3"
compute_image = "CentOS8.3"

control_flavor = "gen.c16m30"
