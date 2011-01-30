function Get-CflSpace
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0)]
		[string]$Name = "*",
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	$Session.Proxy.GetSpaces($Session.Token) | Where-Object {$_.Name -like $Name}
}