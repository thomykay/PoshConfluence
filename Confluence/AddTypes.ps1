#Author: thkrause
#Date: 2/12/2012 16:35:18
#Script: AddTypes
Add-Type -Path "$psScriptRoot\CflSession.cs", "$psScriptRoot\CflSessionManager.cs", "$psScriptRoot\PageSet.cs"
$proxy = (New-WebServiceProxy $psScriptRoot\confluence-v2.wsdl -Namespace ThomyKay.Confluence -Class ConfluenceProxy)