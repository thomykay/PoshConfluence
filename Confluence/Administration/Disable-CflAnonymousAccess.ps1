#Author: thkrause
#Date: 4/9/2011 5:55:43 PM
#Script: Disable-CflAnonymousAccess
function Disable-CflAnonymousAccess
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	if ($psCmdlet.ShouldProcess($session.Proxy.Url))
	{
		$Session.Proxy.setEnableAnonymousAccess($session.Token, $false)
	}
}