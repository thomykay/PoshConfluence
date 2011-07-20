#thkrause
#Date: 7/8/2011 2:45:27 PM
#Script: ConvertTo-CflTable
function ConvertTo-CflTable
{
<#
	.SYNOPSIS
		Converts an input object into a table in Confluence wiki style.

	.DESCRIPTION
		A detailed description of the function.

	.PARAMETER  ParameterA
		The description of the ParameterA parameter.

	.PARAMETER  ParameterB
		The description of the ParameterB parameter.

	.EXAMPLE
		PS C:\> Get-Something -ParameterA 'One value' -ParameterB 32

	.EXAMPLE
		PS C:\> Get-Something 'One value' 32

	.INPUTS
		System.String,System.Int32

	.OUTPUTS
		System.String

	.NOTES
		Additional information about the function go here.

	.LINK
		about_functions_advanced

	.LINK
		about_comment_based_help

#>

	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		$InputObject
	)
begin
	{
		$headerGenerated = $false
	}
process
	{
		if (!$headerGenerated)
		{
			$headerGenerated = $true
			$InputObject.PSObject.Properties | % -Begin {$header = ""} -Process {$header += "||$($_.Name)"} -End {$header += "||"}
			$header
		}
		
		$InputObject.PSObject.Properties | % -Begin {$row = ""} -Process {$row += "|$($_.Value)"} -End {$row += "|"}
		$row
	}
end
	{
	}
}