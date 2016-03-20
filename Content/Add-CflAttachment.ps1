#Author: thkrause
#Date: 4/9/2011 7:02:00 PM
#Script: Add-CflAttachment
function Add-CflAttachment
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[ValidateScript({$_ -is [ThomyKay.Confluence.RemoteBlogEntrySummary] -or $_ -is [ThomyKay.Confluence.RemotePageSummary]})]
		$Item,

        [string]$Name,

        [string]$Path,

        [string]$ContentType,

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Confluence.CflSession]$Session = (Get-CflSession -Current)
	)
begin {
}
process {
    if (!$ContentType)
    {
        $ContentType = "application/pdf"
    }

	$attachment = New-Object ThomyKay.Confluence.RemoteAttachment -Property @{
		PageId = $Item.Id;
		Title = $Name;
		Comment = $Comment;
		FileName = $Name;
		ContentType = $ContentType;
	}
	
    $content = Get-Content $Path -Encoding Byte
	$session.Proxy.addAttachment($session.Token, $Item.id, $attachment, $content)
}
end {
}
}