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
    ![Output](https://github.com/ManuPerezSan/Get-CtxClientVersion/blob/master/Images/Output_Get-CtxClientVersions.png)

## Grafana
    ![Grafana](/images/Grafana_Get-CtxClientVersions.png)
