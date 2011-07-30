#Author: thkrause
#Date: 3/24/2011 9:12:35 PM
#Script: Get-CflPage
function Get-CflPage
{
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
		
		($SpaceKey | %{$session.Proxy.getPages($session.Token, $_)}) | Where-Object {$_.title -like $Title}
	}
}