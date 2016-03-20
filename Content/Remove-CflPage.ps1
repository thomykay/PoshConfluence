#Author: thkrause
#Date: 4/3/2011 1:22:24 PM
#Script: Remove-CflPage
function Remove-CflPage
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemotePageSummary]$Page,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin {}
process {	
	if ($psCmdlet.ShouldProcess($Page.Title))
		{
			[Void]$Session.Proxy.removePage($Session.Token, $Page.id)
		}
    }
end {}
}