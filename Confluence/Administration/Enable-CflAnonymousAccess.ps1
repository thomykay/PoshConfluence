#Author: thkrause
#Date: 4/9/2011 5:51:27 PM
#Script: Enable-CflAnonymousAccess
function Enable-CflAnonymousAccess
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	if ($psCmdlet.ShouldProcess($session.Proxy.Url))
	{
		$Session.Proxy.setEnableAnonymousAccess($session.Token, $true)
	}
}