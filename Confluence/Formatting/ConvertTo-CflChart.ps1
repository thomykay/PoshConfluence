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
		$Orientation = "vertical",
		
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
		[int]$Width,
		
		[Parameter(Mandatory = $false)]
		[int]$Height,
		
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
}

