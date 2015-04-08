#Author: thkrause
#Date: 3/23/2011 9:50:02 PM
#Script: Enable-CflUser
function Enable-CflUser
{
	[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact = "Medium")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteUser]$User,
	
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	if ($psCmdlet.ShouldProcess($User.Name))
	{
		$Session.proxy.reactivateUser($Session.Token, $User.Name)
	}
}