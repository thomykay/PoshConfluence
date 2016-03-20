function Enter-CflSession
{
	[CmdletBinding()]
	param (
	[Parameter(Mandatory=$true, Position = 0)]
	[Uri]$ConnectionUri,
	
	[Parameter(Mandatory=$true, Position = 1)]
	[Management.Automation.Credential()]
	[Management.Automation.PSCredential]$Credential
	)
	
	[Uri]$soapUri = $ConnectionUri.AbsoluteUri.TrimEnd('/') + "/rpc/soap-axis/confluenceservice-v2?wsdl"
	#$proxy = New-WebServiceProxy -Uri $soapUri -Credential $Credential -Namespace Throw.ThomyKay.Confluence -Class ConfluenceProxy

	#TODO: Care about domain part?
	$proxy.Url = $soapUri
    $proxy.Credentials = $Credential
	$token = $proxy.login($Credential.GetNetworkCredential().UserName, $Credential.GetNetworkCredential().Password)
	
	$session = New-Object ThomyKay.Confluence.CflSession -property @{
		Token = $token;
		Proxy = $proxy;
        ConnectionUri = $ConnectionUri.AbsoluteUri.TrimEnd('/')
	}
	
	$CflSessionManager.Enter($session)
}