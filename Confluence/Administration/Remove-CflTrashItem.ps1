function Remove-CflTrashItem
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteContentSummary]$TrashItem,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
{
	if ($psCmdlet.ShouldProcess($trashitem.title)
	{
		[Void]$Session.Proxy.purgeFromTrash($session.Token, $trashitem.space, $trashitem.id)
	}
}
}