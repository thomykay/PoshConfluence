#Author: thkrause
#Date: 4/9/2011 9:24:15 PM
#Script: Remove-CflComment
function Remove-CflComment
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.RemoteComment]$Comment,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
process
	{
		if ($psCmdlet.ShouldProcess($Comment.Title))
		{
			[Void]$Session.Proxy.removeComment($Session.Token, $Comment.Id)	
		}
	}
}
