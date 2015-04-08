#Author: thkrause
#Date: 8/6/2012 1:34:47 PM
#Script: Add-CflGroupMember
function Add-CflGroupMember {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$GroupName,

		[Parameter(Mandatory = $true, Position = 1)]
		[string]$UserName,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	[Void]$Session.Proxy.addUserToGroup($Session.Token, $UserName, $GroupName)
}
}