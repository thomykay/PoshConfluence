#Author: thkrause
#Date: 3/18/2012 18:31:49
#Script: ConvertTo-CflStorageFormat
function ConvertTo-CflStorageFormat
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true, Position = 0, ValueFromPipeline = $true)]
		[string]$Content,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
{
	$Session.Proxy.convertWikiToStorageFormat($Session.Token, $Content)
}
}