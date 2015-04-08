#Author: thkrause
#Date: 4/30/2012 08:38:46
#Script: Convert-CflArchiveUser
function Convert-CflArchiveUser
{
	param (
		[Parameter(Mandatory= $true, Position = 0)]
		[ValidateNotNull()]
		[string]$Path,
		
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
		[ValidateNotNull()]
		[Alias("Name")]
		[string]$FromUser,
		
		[Parameter(Mandatory = $true, Position = 2, ValueFromPipelineByPropertyName = $true)]
		[Alias("Value")]
		[ValidateNotNull()]
		[string]$ToUser,
		
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[string]$NewArchiveFileName
	)
begin
{
	$fileName = "entities.xml"
	$shell = new-object -com shell.application
	$zip = $shell.NameSpace($Path)
	$tempDir = Join-Path ([IO.Path]::GetTempPath()) ([Guid]::NewGuid())
	[void](New-Item $tempDir -ItemType Directory)
	$destination = $shell.NameSpace($tempDir)
	$source = $zip.Items() | Where-Object {$_.Name -eq $fileName}
	$destination.CopyHere($source)
	$entityXmlSourcePath = (Join-Path $tempDir $fileName)
	[xml]$content = Get-Content -Path $entityXmlSourcePath
	$navigator = $content.CreateNavigator()
	$occurences = $navigator.Select("//property[(@name='owner' or @name='user' or @name='userName' or @name='lastModifierName' or @name='creatorName') and (not(@class))]") `
				| where {!$_.IsEmptyElement} `
}
process
{
	$thisUserOccurences = $occurences | Where {$_.Value -eq $FromUser}
	$thisUserOccurences | %{$_.InnerXml = $ToUser}
	#TODO: remove the matches from the collection to prevent 'uebersprechen' in the pipeline
}
end
{
	#pack into archive
	$content.Save($entityXmlSourcePath)
	$newContent = $shell.NameSpace($entityXmlSourcePath)
	$source.CopyHere($newContent)
}
}