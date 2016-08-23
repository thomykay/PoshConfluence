#Author: thkrause
#Date: 2/1/2012 15:24:51
#Script: Add-CflLabel
function Add-CflLabel
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[ValidateScript({$_ -is [ThomyKay.Confluence.RemoteBlogEntrySummary] -or $_ -is [ThomyKay.Confluence.RemotePageSummary]})]
		$Item,
		
		[Parameter(Mandatory = $false, Position = 0, ValueFromPipelineByPropertyName = $true)]
		[string[]]$Name,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin {}
process 
    {
	    $Name | %{
            $label = ($_.Trim()) -replace " & ","_" `
            -replace "&","_" `
            -replace " / ","_"`
            -replace "/","_"`
            -replace " \\ ", "_"`
            -replace "\\","_"`
            -replace " ","_"

            [void]$session.Proxy.addLabelByName($session.Token, $label, $Item.id);
        }
    }
end {}
}