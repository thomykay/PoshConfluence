function Get-CflSpaceTrash {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory= $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	$Session.Proxy.getTrashContents($Session.Token, $Space.key,0,100000)
}
}