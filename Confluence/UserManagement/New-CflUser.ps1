#Author: thkrause
#Date: 3/23/2011 9:51:44 PM
#Script: New-CflUser
function New-CflUser
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[Alias("SamAccountName")]
		[ValidateNotNull()]
		[string]$Name,
		
		[Parameter(Mandatory=$true, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[ValidateNotNull()]
		[string]$Password,
		
		[Parameter(Mandatory=$true, Position = 2, ValueFromPipelineByPropertyName = $true)]
		[Alias("DisplayName")]
		[ValidateNotNull()]
		[string]$FullName,
		
		[Parameter(Mandatory=$true, Position = 3, ValueFromPipelineByPropertyName = $true)]
		[ValidateNotNull()]
		[string]$Email,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		$user = New-Object ThomyKay.Confluence.RemoteUser -Property @{
			Name = $Name;
			Fullname = $FullName;
			Email = $Email
		}
		$Session.Proxy.addUser($Session.Token, $user, $Password)
	}
}