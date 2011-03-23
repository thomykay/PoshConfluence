#Author: thkrause
#Date: 3/23/2011 9:52:31 PM
#Script: Get-CflUser
function Get-CflUser
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name = "*",
			
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		$Session.Proxy.getActiveUsers($Session.Token, $true) | `
			Where-Object {$_ -like $Name} | `
			%{$Session.Proxy.getUser($Session.Token, $_)}
	}
}