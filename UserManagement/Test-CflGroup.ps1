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
function Test-CflGroup
{
    [CmdletBinding()]
    [OutputType([bool])]
    Param
    (
        # This is the group name
        [Parameter(Mandatory=$true, ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [Alias("Group","Name")]
        $GroupName,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
    )

begin
    {
    }
process
    {
        $Session.Proxy.hasGroup($Session.Token, $GroupName)
    }
end
    {
    }
}
