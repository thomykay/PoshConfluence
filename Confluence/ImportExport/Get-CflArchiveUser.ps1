#Author: thkrause
#Date: 4/30/2012 15:13:25
#Script: Get-CflArchiveUser
function Get-CflArchiveUser
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
		[ValidateNotNull()]
		[string]$Path
	)
begin
{
}
process
{
	$fileName = "entities.xml"
	$shell = new-object -com shell.application
	$zip = $shell.NameSpace($Path)
	$tempDir = Join-Path ([IO.Path]::GetTempPath()) ([Guid]::NewGuid())
	[void](New-Item $tempDir -ItemType Directory)
	try
		{
			$destination = $shell.NameSpace($tempDir)
			$source = $zip.Items() | Where-Object {$_.Name -eq $fileName}
			$destination.CopyHere($source)
			
			[xml]$content = Get-Content -Path (Join-Path $tempDir $fileName)
			$navigator = $content.CreateNavigator()
			$navigator.Select("//property[(@name='owner' or @name='user' or @name='userName' or @name='lastModifierName' or @name='creatorName') and (not(@class))]") `
				| where {!$_.IsEmptyElement} `
				| select Value -Unique
		}
	finally
		{
			Remove-Item $tempDir -Recurse
		}
}
end
{
}
}