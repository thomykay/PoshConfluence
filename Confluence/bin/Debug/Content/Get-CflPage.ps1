#Author: thkrause
#Date: 3/24/2011 9:12:35 PM
#Script: Get-CflPage
function Get-CflPage
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title = "*",
			
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary[]] $Space = (Get-CflSpace),

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		($Space | %{$session.Proxy.getPages($session.Token, $_.key)}) | Where-Object {$_.title -like $Title}
	}
}