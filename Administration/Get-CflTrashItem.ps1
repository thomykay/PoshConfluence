function Get-CflTrashItem
{
	<#
		.SYNOPSIS
			Lists the content of the Confluence trash.
	
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
	
	[CmdletBinding(DefaultParameterSetName = "BySpaceKey")]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title = "*",

		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true, ParameterSetName = "BySpace")]
		[ThomyKay.Confluence.RemoteSpaceSummary[]] $Space = (Get-CflSpace),
		
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true, ParameterSetName = "BySpaceKey")]
		[string[]] $SpaceKey = (Get-CflSpace | %{$_.Key}),

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)

process 
{	
		switch ($psCmdlet.ParameterSetName)
		{
			"BySpace" { $Space | %{[array]$SpaceKey += $_.Key}}
		}

	$SpaceKey | %{($session.Proxy.getTrashContents($session.Token, $_, 0, [int]::MaxValue)).content | Where-Object {$_.Title -like $Title}}
}	
}