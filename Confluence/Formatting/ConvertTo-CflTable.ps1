#thkrause
#Date: 7/8/2011 2:45:27 PM
#Script: ConvertTo-CflTable
function ConvertTo-CflTable
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		$InputObject
	)
begin
	{
	}
process
	{
		if (!$headerGenerated)
		{
			$headerGenerated = $true
			$InputObject.PSObject.Properties | % -Process {$header += "||$($_.Name)"} -End {$header += "||"}
			$header
		}
		
		$InputObject.PSObject.Properties | % -Begin {$row = ""} -Process {$row += "|$($_.Value)"} -End {$row += "|"}
		$row
	}
end
	{
	}
}