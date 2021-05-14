data "external" "os_config" {
  program = ["./os_config.py"]
  query = {
    cloud = local.config.cloud.name
  }
}