#Author: thkrause
#Date: 3/15/2011 4:28:37 PM
#Script: Move-CflPage
function Move-CflPage
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemotePageSummary]$Page,

		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
        [Alias("ToPage")]
		[ThomyKay.Confluence.RemotePageSummary]$TargetPage,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin {
}
process {
	if ($PSCmdlet.ShouldProcess($Page.title))
	{
		$Session.Proxy.movePage($Session.Token, $Page.id, $TargetPage.id, "append") | out-null
	}
}
end {
}
}