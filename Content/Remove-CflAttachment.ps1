#Author: thkrause
#Date: 4/9/2011 9:25:21 PM
#Script: Remove-CflAttachment
function Remove-CflAttachment
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.RemoteAttachment]$Attachment,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		if ($psCmdlet.ShouldProcess($Attachment.Title))
		{
			[Void]$Session.Proxy.removeAttachment($session.Token, $Attachment.PageId, $Attachment.Title)
		}
	}
}