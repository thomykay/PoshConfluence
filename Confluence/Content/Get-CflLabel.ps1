#Author: thkrause
#Date: 4/9/2011 6:04:20 PM
#Script: Get-CflLabel
function Get-CflLabel
{
	[CmdletBinding(DefaultParameterSetName = "Popular")]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ParameterSetName = "Popular")]
		[int]$Popular=20,
		
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true, ParameterSetName = "Popular")]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	switch ($psCmdlet.ParameterSetName)
	{
		"Popular"
		{
			if ($Space)
			{
				$Session.Proxy.getMostPopularLabelsInSpace($session.Token, $space.key, $Popular)
			}
			else
			{
				$session.Proxy.getMostPopularLabels($session.Token, $Popular)
			}
		}
	}
}