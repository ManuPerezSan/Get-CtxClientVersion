<#
.SYNOPSIS
    Connect to remote XenDesktop farm (CVAD) to obtain data about Client Receiver versions.

.PARAMETER DdcServers
    List of one Delivery Controller per farm.

.PARAMETER Credential
    Credentials to connect to remote server and XenDesktop farm (Read-Only)

.RETURN
    Return data in json format (data can be imported in influxDB)
    
.AUTHOR
    Manuel Pérez

.PROJECTURI
    https://github.com/ManuPerezSan

.REQUIREMENTS
    Right to connect to Delivery Controller through WinRM
    Read-only permissions in XenDesktop farm

#>
[CmdletBinding()]
Param(
[Parameter(Mandatory=$true, Position=0)][string[]]$DdcServers,
[Parameter(Mandatory=$true, Position=1)][pscredential]$Credential
)

$clientVersions = @()
$Farms = @()

Foreach($ddc in $DdcServers){

    $s01 = New-PsSession -Computer $ddc -Credential $Credential

    $siteName = Invoke-command -Session $s01 -ScriptBlock{ (Get-BrokerSite).Name }

    if ($Farms.IndexOf($siteName) -lt 0) {
    
        $Farms += $siteName
        
        try{

            $returnedData = Invoke-command -Session $s01 -ScriptBlock{

                $array=@()

                Add-PSSnapin citrix.*
                $sessions = Get-BrokerSession -AdminAddress localhost

                foreach ($i in ($sessions| group ClientVersion)){ 

                  if ($i.Name -eq ""){
                    $version = '-'
                  }else{
                    $version = $i.Name
                  }

                  $Object = New-Object PSObject
                  $Statistics = New-Object PSObject

                  $Statistics | add-member Noteproperty UsedReceiverVersion_Qty $i.count

                  $Object | add-member Noteproperty ReceiverVersion $version
                  $Object | add-member Noteproperty Statistics $Statistics                

                  $array += $Object


                }

                return $array

            } | Select -Property ReceiverVersion,Statistics

        }catch{
            Remove-PSSession $s01 -Confirm:$false
        }
        
        $clientVersions += $returnedData
        
    }
    
    Remove-PSSession $s01 -Confirm:$false

}

ConvertTo-Json $clientVersions -Depth 2 #-Compress
