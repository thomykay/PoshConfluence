#Author: thkrause
#Date: 3/22/2011 6:20:00 PM
#Script: New-CflSpace
function New-CflSpace
{
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$true, Position = 0)]
		[Alias("ID")]
		[string]$Key,
		[Parameter(Mandatory=$true, Position = 1)]
		[string]$Name,
		[Parameter(Mandatory=$false, Position = 2)]
		[string]$Description,
		[Parameter(Mandatory = $false)]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$space = New-Object ThomyKay.Confluence.RemoteSpace -Property @{
		key = $Key;
		name = $Name;
		description = $Description
	}
	$Session.Proxy.addSpace($Session.Token, $space)
}