function Enter-CflSession
{
	[CmdletBinding()]
	param (
	[Parameter(Mandatory=$true, Position = 0)]
	[Uri]$ConnectionUri,
	[Parameter(Mandatory=$true, Position = 1)]
	[System.Management.Automation.Credential()]
	[System.Management.Automation.PSCredential]$Credential
	)
	
	[Uri]$soapUri = $ConnectionUri.ToString() + "rpc/soap-axis/confluenceservice-v1?wsdl"
	$proxy = New-WebServiceProxy -Uri $soapUri -Credential $Credential
	#TODO: Care about domain part?
	$ticket = $proxy.login($Credential.GetNetworkCredential().UserName, $Credential.GetNetworkCredential().Password)
	$proxy.getSpaces($ticket)
}