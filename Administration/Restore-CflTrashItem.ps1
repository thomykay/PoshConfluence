function Restore-CflTrashItem
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteContentSummary]$TrashItem,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
{
	#[Void]$Session.Proxy.purgeFromTrash($session.Token, $trashitem.space, $trashitem.id)
	Write-Warning "Restore is currently missing in the Confluence web service."
}
}