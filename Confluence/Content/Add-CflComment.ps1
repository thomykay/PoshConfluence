#Author: thkrause
#Date: 4/9/2011 6:29:01 PM
#Script: Add-CflComment
function Add-CflComment
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[ValidateScript({$_ -is [ThomyKay.Confluence.RemoteBlogEntrySummary] -or $_ -is [ThomyKay.Confluence.RemotePageSummary]})]
		$Item,
		
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Content,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$comment = New-Object ThomyKay.Confluence.RemoteComment -Property @{
		PageId = $Item.id; 
		Content = $Content;
	}
	
	$session.Proxy.addComment($Session.Token, $comment)
}