#Author: thkrause
#Date: 3/24/2011 8:38:40 PM
#Script: New-CflBlogEntry
function New-CflBlogEntry
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string]$Title,
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[string[]]$Content,

		[Parameter(Mandatory = $true, Position = 2, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,
		
		[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
		[datetime]$PublishDate,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process
	{
		if ($psCmdlet.ShouldProcess($Title))
			{
				$blogEntry = New-Object ThomyKay.Confluence.RemoteBlogEntry -Property @{
					Title = $Title;
					Content = $Content | Out-String | ConvertTo-CflStorageFormat -Session $Session;
					Space = $Space.key;
					PublishDate = $PublishDate
				}
			
				$session.Proxy.storeBlogEntry($session.Token, $blogEntry)
			}
	}
}