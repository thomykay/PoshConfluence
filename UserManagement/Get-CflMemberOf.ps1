#Author: thkrause
#Date: 8/6/2012 1:44:02 PM
#Script: Get-CflGroupMember
function Get-CflMemberOf {
	param (
		[Parameter(Mandatory = $true, Position = 0)]
        [Alias("Name")]
		[string]$UserName,
		
		[Parameter(Mandatory = $false, Position = 1)]
		[string]$GroupName = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	Get-CflUser $UserName `
        | %{$Session.Proxy.getUserGroups($Session.Token, $_.name)} `
        | Where-Object {$_ -like $GroupName}
}
}