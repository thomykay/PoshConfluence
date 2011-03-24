#Author: thkrause
#Date: 3/24/2011 8:06:18 PM
#Script: Get-CflGroup
function Get-CflGroup
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name = "*",
			
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$session.Proxy.getGroups($session.Token) | Where-Object {$_ -like $Name}
}