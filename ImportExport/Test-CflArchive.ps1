#Author: thkrause
#Date: 4/30/2012 08:35:32
#Script: Test-CflArchive
function Test-CflArchive
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[ValidateNotNull()]
		[string]$Path,
		
		[Parameter(Mandatory = $true, Position = 1)]
		[ValidateSet("space", "all")]
		[ValidateNotNull()]
		[string]$Type
	)
begin
{
}
process
{
	$info = Get-CflArchive $Path
	$valid = $info.exportType -ieq $Type
	if (!$valid)
	{
		Write-Verbose "Archive at '$Path' is not a '$Type' archive, it's a '$($info.exportType)' archive."
	}
	$valid
}
end
{
}
}