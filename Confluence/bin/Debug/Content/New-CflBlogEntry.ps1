#Author: thkrause
#Date: 3/24/2011 8:38:40 PM
#Script: New-CflBlogEntry
function New-CflBlogEntry
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
process
	{
		$blogEntry = New-Object ThomyKay.Confluence.RemoteBlogEntry -Property @{
			Title = $Title;
			Content = $Content;
			Space = $Space
		}
		
		$session.Proxy.storeBlogEntry($session.Token, $blogEntry)
	}
}