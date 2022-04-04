# Make sure we don't fail silently.
$ErrorActionPreference = 'Stop'
# Fail on uninitialized variables and non-existing properties.
Set-StrictMode -Version Latest

$output = vagrant status --machine-readable
ForEach ($line in $($output -split "`r`n"))
{
	$parts = $line.split(",")
	$hostname = $parts[1]
	$type = $parts[2]
	$value = $parts[3]
	If ($type -eq "state")
	{
		$idPath = ".vagrant\machines\$hostname\virtualbox\id"
		$virtualBoxId = Get-Content $idPath
		$vbOutput = & "c:\Program Files\Oracle\VirtualBox\VBoxManage.exe" guestproperty get "$virtualBoxId" "/VirtualBox/GuestInfo/Net/1/V4/IP"
		$ipAddress = $vbOutput.split(":")[1].trim()
		Write-Host "$hostname ansible_host=$ipAddress"
	}
}
