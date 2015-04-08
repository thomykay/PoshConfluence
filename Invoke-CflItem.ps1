#Author: thkrause
#Date: 4/6/2011 12:33:43 PM
#Script: Invoke-CflItem
function Invoke-CflItem
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ValidateNotNull()]
		$Item
	)

process
	{
		[Diagnostics.Process]::Start($Item.Url)
	}
}