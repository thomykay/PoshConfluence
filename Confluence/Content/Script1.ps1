#Author: thkrause
#Date: 4/28/2011 9:25:40 PM
#Script: Script1
function Get-CflLabel
{
	[CmdletBinding(DefaultParameterSetName = "Popular")]
	param (
		
		[Parameter(Mandatory = $false, Position = 0)]
		[string]$Name = "*",

		[Parameter(Mandatory = $false, ParameterSetName = "Popular")]
		[switch]$Popular,
		
		[Parameter(Mandatory = $false)]
		[ThomyKay.Confluence.RemoteSpaceSummary[]] $Space = (Get-CflSpace),

		
		[Parameter(Mandatory = $true, ParameterSetName = "Recent")]
		[switch]$Recent,
		
		[Parameter(Mandatory = $true, Position = 1, ParameterSetName = "Item")]
		$Item,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	switch ($psCmdlet.ParameterSetName)
	{
		"Popular"	{
						if (!$PSBoundParameters.ContainsKey("Space"))
						{
							$Session.Proxy.getMostPopularLabels($session.Token, 100) | Where-Object {$_.name -like $Name}
						}
						else
						{
							$Space | %{$session.Proxy.getMostPopularLabelsInSpace($session.Token, $_.key, 100)} | Where-Object {$_.name -like $Name}
						}
					}
		"Recent" 	{
						if (!$PSBoundParameters.ContainsKey("Space"))
						{
							$session.Proxy.getRecentlyUsedLabels($session.Token, 100) | Where-Object {$_.name -like $Name}
						}
						else
						{
							$Space | %{$session.Proxy.getRecentlyUsedLabelsInSpace($session.Token, $_.key, 100)} | Where-Object {$_.name -like $Name}
						}
					}
		"Item"		{
					}
	}
	$Session.Proxy.getm	
}