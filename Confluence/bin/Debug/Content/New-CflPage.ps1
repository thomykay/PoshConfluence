#Author: thkrause
#Date: 4/3/2011 1:21:12 PM
#Script: New-CflPage
function New-CflPage
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title,
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[string]$Content,

		[Parameter(Mandatory = $true, Position = 2, ValueFromPipelineByPropertyName = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$page = new-object ThomyKay.Confluence.RemotePage -Property @{
		Title = $Title;
		Content = $Content;
		Space = $space.key
	}
	
	$Session.Proxy.storePage($Session.Token, $page)
}