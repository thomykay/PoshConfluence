#Author: thkrause
#Date: 3/22/2011 6:20:19 PM
#Script: Remove-CflSpace
function Remove-CflSpace
{
	[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact = "High")]
	param (
	[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
	[ThomyKay.Confluence.RemoteSpaceSummary]$Space,
	
	[Parameter(Mandatory = $false)]
	[ValidateNotNull()]
	[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin
	{
	}
process
	{
		if ($psCmdlet.ShouldProcess($Space.Name))
		{
			[Void]$session.Proxy.RemoveSpace($Session.Token, $Space.Key)
		}
	}
end
	{
	}
}