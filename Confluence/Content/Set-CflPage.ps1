function Set-CflPage
{
	<#
		.SYNOPSIS
			Sets the content of a page.
	
		.DESCRIPTION
			 If the page doesn't exist, it gets created. if the page exists already, a new version is created.
	
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
	
	#>
	
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
	param (
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[string]$Title,
		
		[Parameter(Mandatory = $false, Position = 2, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[string[]]$Content,
		
		[Parameter(Mandatory = $false)]
		[switch]$MinorEdit,
		
		[Parameter(Mandatory = $false)]
		[string]$VersionComment,
		
		[Parameter(Mandatory = $true, Position = 2)]
		$Space,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
		if ($psCmdlet.ShouldProcess($Title))
			{
				if ($Space -is [ThomyKay.Confluence.RemoteSpaceSummary])
					{
						$space = $space.Key
					}
				
				$page = Get-CflPage $Title $Space | select -First 1
				
				if (!$page)
				{
					Write-Verbose "Page $Title not found, creating a new page."
					[Void]$PSBoundParameters.Remove("MinorEdit")
					[Void]$PSBoundParameters.Remove("VersionComment")
					New-CflPage @psBoundParameters
				}
				else
				{
					Write-Verbose "Page $Title found, updating page."
					[Void]$PSBoundParameters.Remove("Space")
					$PSBoundParameters.Add("Page", $page)
					Update-CflPage @psBoundParameters
				}
			}
}