#Author: thkrause
#Date: 8/6/2012 1:44:02 PM
#Script: Get-CflGroupMember
function Get-CflGroupMember {
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$GroupName,
		
		[Parameter(Mandatory = $false, Position = 1)]
		[Alias("UserName")]
		[string]$Name = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	Get-CflUser $Name | Where-Object {$Session.Proxy.getUserGroups($Session.Token, $_.name) -contains $GroupName}
}
}