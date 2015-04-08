function Remove-CflSession
{
	[CmdletBinding()]
	param(
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session
	)
	
	$SessionManager.Remove($Session)
}