#Author: thkrause
#Date: 3/24/2011 9:12:01 PM
#Script: Get-CflBlogEntry
function Get-CflBlogEntry
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Title = "*",
			
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$session.Proxy.getBlogEntries($session.Token, $Space.key) | Where-Object {$_.title -like $Title}
}