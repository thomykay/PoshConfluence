function Clear-CflTrash 
{
<#
	.SYNOPSIS
		Clears the confluence trash for 1 or multiple spaces.

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

	.NOTES
		Additional information about the function go here.

	.LINK
		about_functions_advanced

	.LINK
		about_comment_based_help

#>

	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ParameterSetName = "BySpace")]
		[ValidateNotNull()]
		[ThomyKay.Confluence.RemoteSpaceSummary[]] $Space,
		
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ParameterSetName = "BySpaceKey")]
		[ValidateNotNull()]
		[string[]] $SpaceKey,

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

	if ($psCmdlet.ShouldProcess("space '$SpaceKey'"))
	{
		$SpaceKey | %{[Void]$session.Proxy.emptyTrash($session.Token, $_)}
	}
}
}