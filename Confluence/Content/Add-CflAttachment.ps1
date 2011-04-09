#Author: thkrause
#Date: 4/9/2011 7:02:00 PM
#Script: Add-CflAttachment
function Add-CflAttachment
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$attachment = New-Object ThomyKay.Confluence.RemoteAttachment -Property @{
		PageId = $Item.Id;
		Title = $Title;
		Comment = $Comment;
		FileName = $FileName;
		ContentType = $ContentType;
	}
	
	$session.Proxy.addAttachment($session.Token, $attachment, $null)
}