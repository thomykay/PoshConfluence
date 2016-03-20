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
function Search-CflContent
{
    [CmdletBinding()]
    [OutputType([int])]
    Param
    (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $false)]
		[string]$Query,

		[Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true)]
		[ThomyKay.Confluence.RemoteSpaceSummary]$Space,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
    )

    begin
    {
	    $parameters = New-Object ThomyKay.Confluence.Map
	}
    process
    {
        
        if ($Space)
        {
            $item = new-object ThomyKay.Confluence.mapItem
            $item.key = "spaceKey"
            $item.value = $Space.key
            $parameters.item = $item
        }
            
		$Session.Proxy.search($Session.Token, $Query, $parameters, 100000)
    }
    end
    {
    }
}