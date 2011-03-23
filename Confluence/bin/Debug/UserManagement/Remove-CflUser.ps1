#Author: thkrause
#Date: 3/23/2011 10:02:10 PM
#Script: Remove-CflUser
function Remove-CflUser
{
	[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteUser]$User,
	
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	if ($psCmdlet.ShouldProcess($User.Name))
	{
		$Session.proxy.removeUser($Session.Token, $User.Name)
	}
}