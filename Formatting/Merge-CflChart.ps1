function Merge-CflChart
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		$InputObject,
		
		[Parameter(Mandatory=$true)]
		[string[]]$content
	)
}