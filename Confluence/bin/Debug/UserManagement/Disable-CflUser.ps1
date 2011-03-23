#Author: thkrause
#Date: 3/23/2011 9:50:53 PM
#Script: Disable-CflUser
function Disable-CflUser
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
		$Session.proxy.deactivateUser($Session.Token, $User.Name)
	}
}