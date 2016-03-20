function Get-CflSpace
{
	[CmdletBinding(DefaultParameterSetName="")]
	param (
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]$Name = "*",

        [Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName="ByLabel")]
        [string]$Label,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)

process
	{
        if ($PSCmdlet.ParameterSetName -eq "ByLabel")
        {
            $spaces = $Session.Proxy.getSpacesWithLabel($Session.Token, $Label) `
                | Where-Object {$_.name -like $Name}
            $Session.Proxy.GetSpaces($Session.Token) | Where-Object {$_.key -in $spaces.key}
        }
        else
        {
		    $Session.Proxy.GetSpaces($Session.Token) | Where-Object {$_.name -like $Name}
        }
	}
}