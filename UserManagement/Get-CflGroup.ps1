#Author: thkrause
#Date: 3/24/2011 8:06:18 PM
#Script: Get-CflGroup
function Get-CflGroup
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name = "*",
		
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true, ParameterSetName = "ByUser")]
		[string]$UserName,
			
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	switch ($psCmdlet.ParameterSetName)
		{
			"ByUser" {
				$session.Proxy.getUserGroups($session.Token, $UserName) | Where-Object {$_ -like $Name}
			}
			default {
				$session.Proxy.getGroups($session.Token) | Where-Object {$_ -like $Name}
			}
		}
}