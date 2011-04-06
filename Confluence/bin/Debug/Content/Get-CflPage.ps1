#Author: thkrause
#Date: 3/24/2011 9:12:35 PM
#Script: Get-CflPage
function Get-CflPage
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title = "*",
			
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		$session.Proxy.getPages($session.Token, $Space.key) | Where-Object {$_.title -like $Title}
	}
}