function Get-CflPlugin {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
process {
    $creds = New-Object System.Management.Automation.PSCredential ($Session.Proxy.Credentials.UserName, $Session.Proxy.Credentials.SecurePassword)
	$headers = @{Authorization="Basic " + [Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("${userName}:$password"))}
    $result = Invoke-RestMethod -Method Get -Headers $headers -Uri ($Session.ConnectionUri + "/rest/plugins/1.0/") -
    $result.plugins | select name, key, version, userinstalled, enabled | ft

    <#
Using the api $ curl -u admin:admin -basic http://localhost:2990/jira/rest/plugins/1.0/ { "plugins":[ { "enabled":true, "name":"Admin Menu Sections", "userInstalled":false, "description":"This library includes the web fragments for the administration menu", "links":{ "modify":"/jira/rest/plugins/1.0/jira.webfragments.admin-key", "delete":"/jira/rest/plugins/1.0/jira.webfragments.admin-key" }, }, ... ], "links":{ "available":"/jira/rest/plugins/1.0/available", "upgrades":"/jira/rest/plugins/1.0/available/upgrades", "enter-safe-mode":"/jira/rest/plugins/1.0/safe-mode", "install":"/jira/rest/plugins/1.0/" ... }, } 10
10. Scripting the UPM #!/usr/bin/env python from subprocess import Popen, PIPE, STDOUT import json,os nul_f = open(os.devnull, w) cmd = curl -basic -u admin:admin http://localhost:2990/jira/rest/plugins/1.0/upgrades p = Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE, stderr=nul_f, close_fds=True) print len(json.loads(p.stdout.read())[plugins]) 11

    #>
    }
}