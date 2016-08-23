#Author: thkrause
#Script: Remove-CflLabel
function Remove-CflLabel
{
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
	param (
		[Parameter(Mandatory = $true, Position = 0, ParameterSetName = "ListOfNames")]
        [string[]]$Name,

		[Parameter(Mandatory = $true, Position = 0, ParameterSetName = "LabelObject", ValueFromPipeline=$true)]
        [ThomyKay.Confluence.RemoteLabel]$Label,

		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline=$true)]
		[ThomyKay.Confluence.RemotePageSummary]$Item,



		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
	
process
	{
    switch ($psCmdlet.ParameterSetName)
    {
        "ListOfNames" {
		    if ($psCmdlet.ShouldProcess("Remove label from '{0}'." -f $item.title))
		    {
                $Name | %{
                    [void]$Session.Proxy.removeLabelByName($Session.Token,$_, $item.id)
                }
		    }
        }
        "LabelObject" {
		    if ($psCmdlet.ShouldProcess(("label '{0}', item '{1}'." -f $Label.name, $item.title)))
		    {
                [void]$Session.Proxy.removeLabelByObject($Session.Token,$Label, $item.id)
		    }
        }
	}
    }
}
