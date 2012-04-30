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
		[string]$FromUser,
		
		[Parameter(Mandatory = $true, Position = 2, ValueFromPipelineByPropertyName = $true)]
		[ValidateNotNull()]
		[string]$ToUser
	)
begin
{
	$fileName = "entities.xml"
	$shell = new-object -com shell.application
	$zip = $shell.NameSpace($Path)
	$tempDir = Join-Path ([IO.Path]::GetTempPath()) ([Guid]::NewGuid())
	[void](New-Item $tempDir -ItemType Directory)
	
}
process
{
}
end
{
}
}