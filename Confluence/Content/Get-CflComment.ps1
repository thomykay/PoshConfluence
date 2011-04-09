#Author: thkrause
#Date: 4/9/2011 6:29:20 PM
#Script: Get-CflComment
function Get-CflComment
{
	[CmdletBinding()]
	param (
 			
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ValidateScript({$_ -is [ThomyKay.Confluence.RemoteBlogEntrySummary] -or $_ -is [ThomyKay.Confluence.RemotePageSummary]})]
		$Item,

		[Parameter(Mandatory = $false, Position = 1)]
		[string]$Content = "*",
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$Session.Proxy.getComments($Session.Token, $Item.Id) | Where-Object {$_.Content -like $Content}
}