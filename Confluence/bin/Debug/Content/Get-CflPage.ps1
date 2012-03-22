#Author: thkrause
#Date: 3/24/2011 9:12:35 PM
#Script: Get-CflPage
function Get-CflPage
{
	[CmdletBinding(DefaultParameterSetName = "BySpace")]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title = "*",
		
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true, ParameterSetName = "BySpace")]
		[ThomyKay.Confluence.RemoteSpaceSummary[]]$Space = (Get-CflSpace),
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true, ParameterSetName = "ByParentPage")]
		[ThomyKay.Confluence.RemotePageSummary]$ParentPage,
		
		[Parameter(Mandatory = $false, ParameterSetName = "ByParentPage")]
		[ThomyKay.Confluence.PageSet]$PageSet = "Children",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		switch ($psCmdlet.ParameterSetName)
		{
			"BySpace" 
				{ 
					$Space | %{[array]$SpaceKey += $_.Key}
					($SpaceKey | %{$session.Proxy.getPages($session.Token, $_)}) | Where-Object {$_.title -like $Title
				}
		}
		
		}
	}
}