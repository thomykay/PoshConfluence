#Author: thkrause
#Date: 3/24/2011 9:12:01 PM
#Script: Get-CflBlogEntry
function Get-CflBlogEntry
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title = "*",
			
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space = (Get-CflSpace),

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	($Space | %{$session.Proxy.getBlogEntries($session.Token, $_.key)}) | Where-Object {$_.title -like $Title}
}