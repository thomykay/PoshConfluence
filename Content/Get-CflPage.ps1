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
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true, ParameterSetName = "ChildrenOf")]
		[ThomyKay.Confluence.RemotePageSummary]$ChildrenOf,
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true, ParameterSetName = "AncestorsOf")]
		[ThomyKay.Confluence.RemotePageSummary]$AncestorsOf,

		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $true, ParameterSetName = "DescendentsOf")]
		[ThomyKay.Confluence.RemotePageSummary]$DescendentsOf,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin{}
process
	{
		switch ($psCmdlet.ParameterSetName)
		{
			"BySpace" 
				{ 
					$Space | %{[array]$SpaceKey += $_.Key}
					($SpaceKey | %{$session.Proxy.getPages($session.Token, $_)}) | Where-Object {$_.title -like $Title}
				}
            "ChildrenOf"
                {
                    $session.Proxy.getChildren($session.Token,$ChildrenOf.id) | Where-Object {$_.title -like $Title}
                }
            "AncestorsOf"
                {
                    $session.Proxy.getAncestors($session.Token,$AncestorsOf.id) | Where-Object {$_.title -like $Title}
                }
            "DescendentsOf"
                {
                    $session.Proxy.getDescendents($session.Token,$DescendentsOf.id) | Where-Object {$_.title -like $Title}
                }
		}
    }
}