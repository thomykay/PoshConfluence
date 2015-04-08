<#
	.SYNOPSIS
		Renders the input as a Confluence chart.

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
		http://confluence.atlassian.com/display/CONF34/Chart+Macro

#>

function ConvertTo-CflChart
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		$InputObject,
		
		#charttype parameters
		[ValidateSet("Pie", "Bar", "Line", "Area", "xyArea", "xyBar", "xyLine", "xyStep", "xyStepArea", "Scatter", "TimeSeries")]
		$ChartType = "Pie",
		
		[Parameter()]
		[ValidateSet("vertical", "horizontal")]
		$DataOrientation = "vertical",
		
		[Parameter()]
		[switch]$3d,
		
		[Parameter()]
		[switch]$Stacked,
		
		[Parameter()]
		[switch]$DontShowShapes,
		
		[Parameter()]
		[ValidateRange(0,100)]
		[int]$Opacity,
		
		#display control parameters
		[Parameter(Mandatory = $false)]
		[int]$Width = 300,
		
		[Parameter(Mandatory = $false)]
		[int]$Height = 300,
		
		[Parameter()]
		[ValidateSet("true", "after", "before")]
		$DataDisplay,
		
		#Title and Label Customisation Parameters
		[Parameter(Mandatory = $false)]
		[string]$Title,
		
		[Parameter(Mandatory = $false)]
		[string]$SubTitle,
		
		[Parameter(Mandatory = $false)]
		[string]$xLabel,
		
		[Parameter(Mandatory = $false)]
		[string]$yLabel,
		
		[Parameter()]
		[switch]$Legend
	)
begin {
	"{chart:type=$ChartType|title=$Title|3d=$3d|DataOrientation=$DataOrientation|Width=$Width|Height=$Height|$DataDisplay=$DataDisplay|$SubTitle=$SubTitle|xLabel=$xLabel|yLabel=$yLabel}"
	$headerGenerated = $false
}
process {
		if (!$headerGenerated)
		{
			$headerGenerated = $true
			$InputObject.PSObject.Properties | % -Begin {$header = ""} -Process {$header += "||$($_.Name)"} -End {$header += "||"}
			$header
		}
		
		$InputObject.PSObject.Properties | % -Begin {$row = ""} -Process {$row += "|$($_.Value)"} -End {$row += "|"}
		$row
}
end {	
	"{chart}"
}	
}

