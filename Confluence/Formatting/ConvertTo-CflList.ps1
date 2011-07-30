function ConvertTo-CflList
{
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		$InputObject
	)
	
process
{
	$InputObject.PSObject.Properties | % {"||$($_.Name)|$($_.Value) ||"} 
}
}