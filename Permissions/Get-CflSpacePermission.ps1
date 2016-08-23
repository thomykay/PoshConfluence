function Get-CflSpacePermission
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory= $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,

		[Parameter(Mandatory= $false)]
		[ValidateScript({Get-CflSpaceLevelPermission $_})]
		[string]$Type="*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	$Session.Proxy.getSpacePermissionSets($Session.Token, $Space.key) `
		| Where {$_.type -like $Type} `
		| %{Add-Member -InputObject $_ -Type NoteProperty -Name Space -Value $Space -passthru}
}
}