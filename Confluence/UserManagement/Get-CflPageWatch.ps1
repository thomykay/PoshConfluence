#Author: thkrause
#Date: 8/6/2012 2:36:00 PM
#Script: Get-CflPageWatch
function Get-CflPageWatch {
	[CmdletBinding()]
	param (
		[ThomyKay.Confluence.Rem
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	$Session.Proxy.getWatchersForPage
}
}