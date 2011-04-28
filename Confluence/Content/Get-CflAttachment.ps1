#Author: thkrause
#Date: 4/9/2011 6:48:49 PM
#Script: Get-CflAttachment
function Get-CflAttachment
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ValidateScript({$_ -is [ThomyKay.Confluence.RemoteBlogEntrySummary] -or $_ -is [ThomyKay.Confluence.RemotePageSummary]})]
		$Item,
		
		[Parameter(Mandatory = $false)]
		[string]$FileName = "*",
		
		[Parameter(Mandatory = $false)]
		[string]$Comment = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)

process
	{
		$Session.Proxy.getAttachments($Session.Token, $Item.Id) | Where-Object {$_.FileName -like $FileName -and $_.Comment -like $Comment}
	}
}