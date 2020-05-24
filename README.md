# Get-CtxClientVersion
Connect to remote XenDesktop farm (CVAD) to obtain data about Client Receiver versions

## Paramater DdcServers
    List of one Delivery Controller per farm.

## Paramater Credential
    Credentials to connect to remote server and XenDesktop farm (Read-Only)

## Return (output)
    Return data in json format (data can be imported in influxDB)
    
## Requirements
    Right to connect to Delivery Controller through WinRM
    Read-only permissions in XenDesktop farm
