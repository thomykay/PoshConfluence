#Author: thkrause
#Date: 3/24/2011 9:07:53 PM
#Script: Import-CflSpace
function Import-CflSpace
{
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$Path,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	$content = [System.IO.File]::ReadAllBytes($Path)
	[Void]$Session.Proxy.importSpace($Session.Token, $content)
}