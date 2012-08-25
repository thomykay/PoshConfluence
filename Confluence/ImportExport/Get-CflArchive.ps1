#Author: thkrause
#Date: 4/30/2012 08:35:58
#Script: Get-CflArchive
function Get-CflArchive
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
	$fileName = "exportDescriptor.properties"
	$shell = new-object -com shell.application
	$zip = $shell.NameSpace($Path)
	$tempDir = Join-Path ([IO.Path]::GetTempPath()) ([Guid]::NewGuid())
	[void](New-Item $tempDir -ItemType Directory)
	try
		{
			$destination = $shell.NameSpace($tempDir)
			$source = $zip.Items() | Where-Object {$_.Name -eq $fileName}
			$destination.CopyHere($source)
			$values = Import-Csv -Delimiter "=" -Header Name,Value -Path (Join-Path $tempDir $fileName)
			$values | % -Begin{$hash = @{}} -Process{$hash.Add($_.Name, $_.Value)}
			$result = New-Object psobject -Property $hash
			$result
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