function Get-CflSession
{
	[CmdletBinding()]
	param(
		[Parameter(Mandatory = $false)]
		[switch]$Current
	)
	
	if ($Current)
		{
			$CflSessionManager.CurrentSession
		}
		else
		{
			$CflSessionManager.Sessions
		}
}