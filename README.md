# Get-CtxClientVersion
Connect to remote XenDesktop farm (CVAD) to obtain data about Client Receiver versions

## Paramater DdcServers
    List of one Delivery Controller per farm.

## Paramater Credential
    Credentials to connect to remote server and XenDesktop farm (Read-Only)
  
## Requirements
    Right to connect to Delivery Controller through WinRM
    Read-only permissions in XenDesktop farm

## Return (output)
    Return data in json format (data can be imported in influxDB)
    ![Output_Get-CtxClientVersions](https://user-images.githubusercontent.com/23212171/82815005-87df5700-9e98-11ea-91ef-8cb7a4ddbc52.png)

## Grafana
    ![Grafana_Get-CtxClientVersions](https://user-images.githubusercontent.com/23212171/82814971-7c8c2b80-9e98-11ea-9c6a-a0c8ad643635.png)
