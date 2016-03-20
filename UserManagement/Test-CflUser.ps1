<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Test-CflUser
{
    [CmdletBinding()]
    [OutputType([bool])]
    Param
    (
        # This is the user name
        [Parameter(Mandatory=$true, ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [Alias("User","Name")]
        $UserName,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
    )

begin
    {
    }
process
    {
        $Session.Proxy.hasUser($Session.Token, $UserName)
    }
end
    {
    }
}
