#Author: thkrause
#Date: 3/24/2011 9:07:22 PM
#Script: Export-CflSite
function Export-CflSite
{
	param (
		[Parameter(Mandatory=$false)]
		[switch]$IncludeAttachments = $true,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin {
}
process {
	$Session.Proxy.exportSite($Session.Token, $IncludeAttachments.IsPresent)
}
end {
}
}