#Author: thkrause
#Date: 3/24/2011 9:08:24 PM
#Script: Export-CflSpace
function Export-CflSpace
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory= $true, Position = 0, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,
		
		[Parameter(Mandatory= $false, Position = 1, ValueFromPipeline = $false)]
		[ValidateSet("TYPE_HTML", "TYPE_XML")]
		[string]$ExportType = "TYPE_XML",

        [Parameter(Mandatory=$false, ValueFromPipeline=$false)]
        [switch]$ExportAll,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin {
	Write-Progress -id 1 -Activity "Space Export" -Status "Initialize"
}
process {
	Write-Progress -id 1 -Activity "Space Export" -Status "Execute" -CurrentOperation "Exporting ""$($Space.name)"" ($($Space.key))"
	$Session.Proxy.exportSpace($Session.Token, $Space.key,$ExportType, $ExportAll.IsPresent)
}
end {
	Write-Progress -id 1 -Activity "Space Export" -Status "Finished" -Completed
}
}