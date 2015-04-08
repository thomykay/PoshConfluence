#Author: thkrause
#Date: 3/24/2011 8:05:39 PM
#Script: Remove-CflGroup
function Remove-CflGroup
{
	[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name,
			
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		#TODO: Add support for defaultGroup
		if ($psCmdlet.ShouldProcess($Name))
		{
			[Void]$session.Proxy.removeGroup($session.Token, $Name, $null)
		}
	}
}