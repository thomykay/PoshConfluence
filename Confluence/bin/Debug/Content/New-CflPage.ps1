#Author: thkrause
#Date: 4/3/2011 1:21:12 PM
#Script: New-CflPage
function New-CflPage
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title,
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[string[]]$Content,

		[Parameter(Mandatory = $true, Position = 2)]
		#[ValidateScript({$space -is [ThomyKay.Confluence.RemoteSpaceSummary] -or $space -is [string]})]
		$Space,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
process
	{
		if ($psCmdlet.ShouldProcess($Title))
			{
				if ($Space -is [ThomyKay.Confluence.RemoteSpaceSummary])
					{
						$space = $space.Key
					}
					
				$page = new-object ThomyKay.Confluence.RemotePage -Property @{
					Title = $Title;
					Content = $Content | Out-String;
					Space = $Space
				}
				
				$Session.Proxy.storePage($Session.Token, $page)
			}
	}
}