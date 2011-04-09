#Author: thkrause
#Date: 4/9/2011 5:57:58 PM
#Script: Disable-CflWysiwyg
function Disable-CflWysiwyg
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	if ($psCmdlet.ShouldProcess($session.Proxy.Url))
	{
		$Session.Proxy.setEnableWysiwyg($session.Token, $false)
	}
}