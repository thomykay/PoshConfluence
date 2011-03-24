#Author: thkrause
#Date: 3/24/2011 8:04:35 PM
#Script: New-CflGroup
function New-CflGroup
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name = "*",
			
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		[Void]$session.Proxy.addGroup($session.Token, $Name)
	}
}