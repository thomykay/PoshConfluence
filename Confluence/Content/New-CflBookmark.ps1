function New-CflBookmark
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[Alias("Name")]
		[string]$Title = $Url,
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[Alias("Uri", "Address")]
		[Uri]$Url,
		
		[Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[string[]]$Description,

		[Parameter(Mandatory = $true, Position = 2)]
		#[ValidateScript({$space -is [ThomyKay.Confluence.RemoteSpaceSummary] -or $space -is [string]})]
		$Space,
		
		[Parameter(Mandatory = $false)]
		[string[]]$Label,
		
		[Parameter(Mandatory = $false)]
		[switch]$Force,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
	$bookmarksPage = Get-CflPage -Title ".bookmarks" -Space $space -Session $Session
	if (!$bookmarksPage -and $Force)
	{
		$bookmarksPage = New-CflPage -Title ".bookmarks" -Space $Space -Session $Session
	}
	
	$content = "{bookmark:url=$Url|htmlbody=$true}$Description{bookmark}"
	New-CflPage -Title $Title -Content (ConvertTo-CflStorageFormat $content -Session $Session) -Space $Space -ParentPage $bookmarksPage -Session $Session
}
}