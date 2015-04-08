#Author: thkrause
#Date: 8/6/2012 1:35:12 PM
#Script: Remove-CflGroupMember
function Remove-CflGroupMember {
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[string]$GroupName,

		[Parameter(Mandatory = $true, Position = 1)]
		[string]$UserName,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
		if ($psCmdlet.ShouldProcess($UserName))
		{
			[Void]$Session.proxy.removeUserFromGroup($Session.Token, $UserName, $GroupName)
		}
}
}