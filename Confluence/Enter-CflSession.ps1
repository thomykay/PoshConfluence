function Enter-CflSession
{
	[CmdletBinding()]
	param (
	[Parameter(Mandatory=$true, Position = 0)]
	[Uri]$ConnectionUri,
	
	[Parameter(Mandatory=$true)]
	[System.Management.Automation.Credential()]
	$Credential
	)
	
	[Uri]$soapUri = $ConnectionUri.ToString() + "rpc/soap-axis/confluenceservice-v1?wsdl"
	$proxy = New-WebServiceProxy -Uri $soapUri -Credential $Credential -Namespace ThomyKay.Confluence -Class ConfluenceProxy

	#TODO: Care about domain part?
	$token = $proxy.login($Credential.GetNetworkCredential().UserName, $Credential.GetNetworkCredential().Password)
	
	$session = New-Object ThomyKay.Confluence.CflSession -property @{
		Token = $token;
		Proxy = $proxy
	}
	
	# the condition is temp for PowerWF.
	if ($CflSessionManager)
	{
		$CflSessionManager.Enter($session)
	}
	else
	{
		$session
	}
}