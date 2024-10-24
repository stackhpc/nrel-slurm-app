flavor = "ec1.large" # 8GB RAM, 4GB is too low
image_disk_format = "qcow2" # on some clouds the default is raw
use_blockstorage_volume = true # required to set image format, also decouples image size from build VM flavor disk size

volume_size = 25 # GB - trial and error
volume_type = "unencrypted" # leafcloud specific (default volume is encrypted which can't be turned into a qcow image)

source_image_name = {
    RL8 = null # we don't use this
    RL9 = "openhpc-ofed-RL9-240712-1425-6830f97b" # v1.150
}

# Add only CUDA during build:
groups = {
    openhpc-extra = ["cuda"]
}

networks = ["00b07263-ed53-4104-8357-969cb57363d0"] # (stackhpc-dev) has to have outbound internet and reachable from deploy host

# Don't need to set any ssh_ vars here as can directly reach the VM
