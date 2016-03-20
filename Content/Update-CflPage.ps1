#Author: thkrause
#Date: 4/3/2011 4:28:37 PM
#Script: Update-CflPage
function Update-CflPage
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemotePageSummary]$Page,
		
		[Parameter(Mandatory = $false, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[string]$Title,
		
		[Parameter(Mandatory = $false, Position = 2, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[string[]]$Content,
		
		[Parameter(Mandatory = $false)]
		[switch]$MinorEdit,
		
		[Parameter(Mandatory = $false)]
		[string]$VersionComment,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
	
	$realPage = $Session.Proxy.getPage($Session.Token, $Page.space, $page.title)
	
	if ($psBoundParameters.ContainsKey("Title")) {$realPage.Title = $Title}
	if ($psBoundParameters.ContainsKey("Content")) 
		{
			$realPage.Content = $Content
		}
	
	$changes = New-Object ThomyKay.Confluence.RemotePageUpdateOptions -Property @{
		MinorEdit = $MinorEdit.IsPresent;
		VersionComment = $VersionComment
	}
	
	if ($PSCmdlet.ShouldProcess($page.title))
	{
		$Session.Proxy.updatePage($Session.Token, $realPage, $changes)
	}
}