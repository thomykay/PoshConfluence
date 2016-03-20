function Enable-CflUpmSafeMode {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
            #https://confluence.atlassian.com/display/STASHKB/How+to+Enable+UPM+Safe+Mode+using+UPM+REST+API
        }
}
