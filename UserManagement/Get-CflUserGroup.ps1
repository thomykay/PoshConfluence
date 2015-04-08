#Author: thkrause
#Date: 8/6/2012 2:14:42 PM
#Script: Get-CflUserGroups
function Get-CflUserGroup {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteUser]$User,	
			
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	$Session.Proxy.getUserGroups($Session.Token, $User.name)
}
}