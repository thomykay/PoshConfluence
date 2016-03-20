function Get-CflUpmSetting {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
            #Yes. The API is available at /rest/plugins/1.0/settings. Inspecting your browser's web console will get you details about the API's content type, expected payload and other details.
        }
}