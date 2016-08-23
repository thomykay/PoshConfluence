function Get-CflSpaceLevelPermission
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0)]
		[ValidateNotNull()]
		[string]$Name = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	$Session.Proxy.getSpaceLevelPermissions($Session.Token) `
		| Where {$_ -like $Name};
}
}