clouds:
  ${ os_config.cloud }:
    auth:
      auth_url: ${ os_config.auth_url }
      application_credential_id: "${ app_cred.id }"
      application_credential_secret: "${ app_cred.secret }"
    region_name: "${ os_config.region_name }"
    interface: "${ os_config.interface }"
    identity_api_version: ${ os_config.identity_api_version }
    auth_type: "v3applicationcredential"
