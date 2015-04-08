function Get-CflSpace
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)

process
	{
		$Session.Proxy.GetSpaces($Session.Token) | Where-Object {$_.name -like $Name}
	}
}