#######################################################################################################################
# File:             PoshConfluence.psm1                                                                               #
# Author:           Thomy Kay                                                                                         #
# Publisher:                                                                                                          #
# Copyright:        © 2011 . All rights reserved.                                                                     #
# Usage:            To load this module in your Script Editor:                                                        #
#                   1. Open the Script Editor.                                                                        #
#                   2. Select "PowerShell Libraries" from the File menu.                                              #
#                   3. Check the PoshConfluence module.                                                               #
#                   4. Click on OK to close the "PowerShell Libraries" dialog.                                        #
#                   Alternatively you can load the module from the embedded console by invoking this:                 #
#                       Import-Module -Name PoshConfluence                                                            #
#                   Please provide feedback on the PowerGUI Forums.                                                   #
#######################################################################################################################

# TODO: Define your module here.

$Script:CflSessionManager = New-Object ThomyKay.Confluence.CflSessionManager

# Common cmdlets
. $psScriptRoot\Enter-CflSession.ps1
. $psScriptRoot\Exit-CflSession.ps1
. $psScriptRoot\Get-CflSession.ps1
. $psScriptRoot\New-CflSession.ps1
. $psScriptRoot\Remove-CflSession.ps1
. $psScriptRoot\Invoke-CflItem.ps1

$exportedCmdlets = @(	"Enter-CflSession", `
						"Exit-CflSession", `
						"Get-CflSession", `
						"New-CflSession", `
						"Remove-CflSession", `
						"Invoke-CflItem")						

#space management
. $psScriptRoot\Get-CflSpace.ps1
. $psScriptRoot\New-CflSpace.ps1
. $psScriptRoot\Remove-CflSpace.ps1


$exportedCmdlets += @( "Get-CflSpace", `
						"New-CflSpace", `
						"Remove-CflSpace")

#permission management
. $PSScriptRoot\Permissions\Get-CflSpaceLevelPermission.ps1				
. $PSScriptRoot\Permissions\Get-CflSpacePermission.ps1

$exportedCmdlets += @( "Get-CflSpaceLevelPermission", `
						"Get-CflSpacePermission")

#user management
. $PSScriptRoot\UserManagement\Get-CflUser.ps1
. $PSScriptRoot\UserManagement\New-CflUser.ps1
. $PSScriptRoot\UserManagement\Remove-CflUser.ps1
. $PSScriptRoot\UserManagement\Disable-CflUser.ps1
. $PSScriptRoot\UserManagement\Enable-CflUser.ps1
. $PSScriptRoot\UserManagement\Get-CflGroup.ps1
. $PSScriptRoot\UserManagement\New-CflGroup.ps1
. $PSScriptRoot\UserManagement\Remove-CflGroup.ps1
. $PSScriptRoot\UserManagement\Register-CflPageWatch.ps1
. $PSScriptRoot\UserManagement\Unregister-CflPageWatch.ps1
. $PSScriptRoot\UserManagement\Add-CflGroupMember.ps1
. $PSScriptRoot\UserManagement\Remove-CflGroupMember.ps1
. $PSScriptRoot\UserManagement\Get-CflGroupMember.ps1
. $PSScriptRoot\UserManagement\Get-CflUserGroup.ps1
. $PSScriptRoot\UserManagement\Test-CflUser.ps1
. $PSScriptRoot\UserManagement\Test-CflGroup.ps1
. $PSScriptRoot\UserManagement\Get-CflMemberOf.ps1


$exportedCmdlets += @( "Get-CflUser", `
						"New-CflUser", `
						"Remove-CflUser", `
						"Disable-CflUser", `
						"Enable-CflUser", `
						"Get-CflGroup", `
						"New-CflGroup", `
						"Remove-CflGroup", `
						"Register-CflPageWatch", `
						"Unregister-CflPageWatch", `
						"Add-CflGroupMember", `
						"Remove-CflGroupMember", `
						"Get-CflGroupMember", `
						"Get-CflUserGroup", `
                        "Test-CflUser", `
                        "Test-CflGroup", `
						"Get-CflMemberOf")

#content
. $PSScriptRoot\Content\Get-CflBlogEntry.ps1
. $PSScriptRoot\Content\New-CflBlogEntry.ps1
. $PSScriptRoot\Content\Get-CflPage.ps1
. $PSScriptRoot\Content\New-CflPage.ps1
. $PSScriptRoot\Content\Remove-CflPage.ps1
. $PSScriptRoot\Content\Update-CflPage.ps1
. $PSScriptRoot\Content\Set-CflPage.ps1
. $PSScriptRoot\Content\Update-CflBLogEntry.ps1
. $PSScriptRoot\Content\Get-CflLabel.ps1
. $PSScriptRoot\Content\Get-CflComment.ps1
. $PSScriptRoot\Content\Get-CflAttachment.ps1
. $PSScriptRoot\Content\Add-CflComment.ps1
. $PSScriptRoot\Content\Add-CflAttachment.ps1
. $PSScriptRoot\Content\Remove-CflComment.ps1
. $PSScriptRoot\Content\Remove-CflAttachment.ps1
. $PSScriptRoot\Content\Move-CflPage.ps1
. $psScriptRoot\Content\Get-CflBookmark.ps1
. $psScriptRoot\Content\New-CflBookmark.ps1
. $psScriptRoot\Content\Add-CflLabel.ps1

$exportedCmdlets += @( "Get-CflBlogEntry", `
						"New-CflBlogEntry", `
						"Get-CflPage", `
						"New-CflPage", `
						"Remove-CflPage", `
						"Update-CflPage", `
						"Set-CflPage", `
						"Update-CflBLogEntry", `
						"Get-CflLabel", `
						"Get-CflComment", `
						"Get-CflAttachment", `
						"Add-CflComment", `
						"Add-CflAttachment", `
						"Remove-CflComment", `
						"Remove-CflAttachment", `
						"Move-CflPage", `
						"Get-CflBookmark", `
						"New-CflBookmark", `
                        "Add-CflLabel")

#Formatting
. $PSScriptRoot\Formatting\ConvertTo-CflTable.ps1
. $PSScriptRoot\Formatting\ConvertTo-CflChart.ps1
. $PSScriptRoot\Formatting\ConvertTo-CflList.ps1
. $psScriptRoot\Formatting\ConvertTo-CflStorageFormat.ps1

$exportedCmdlets += @( "ConvertTo-CflTable", `
						"ConvertTo-CflChart", `
						"ConvertTo-CflList", `
						"ConvertTo-CflStorageFormat")

#administration
. $psScriptRoot\Administration\Enable-CflAnonymousAccess.ps1
. $psScriptRoot\Administration\Disable-CflAnonymousAccess.ps1
. $psScriptRoot\Administration\Enable-CflWysiwyg.ps1
. $psScriptRoot\Administration\Disable-CflWysiwyg.ps1
. $PSScriptRoot\Administration\Get-CflTrashitem.ps1
. $PSScriptRoot\Administration\Restore-CflTrashItem.ps1
. $PSScriptRoot\Administration\Clear-CflTrash.ps1

$exportedCmdlets += @( "Enable-CflAnonymousAccess", `
						"Disable-CflAnonymousAccess", `
						"Enable-CflWysiwyg", `
						"Disable-CflWysiwyg", `
						"Get-CflTrashItem", `
						"Restore-CflTrashItem", `
						'Clear-CflTrash')
#Import Export
. $psScriptRoot\ImportExport\Get-CflArchive.ps1
. $psScriptRoot\ImportExport\Get-CflArchiveUser.ps1
. $psScriptRoot\ImportExport\Test-CflArchive.ps1
. $psScriptRoot\ImportExport\Export-CflSpace.ps1
. $psScriptRoot\ImportExport\Import-CflSpace.ps1
. $psScriptRoot\ImportExport\Export-CflSite.ps1

$exportedCmdlets += @(	"Get-CflArchive", `
						"Get-CflArchiveUser", `
						"Test-CflArchive", `
						"Export-CflSpace", `
						"Import-CflSpace", `
						"Export-CflSite")

#UPM API
. $psScriptRoot\Plugins\Get-CflPlugin.ps1

$exportedCmdlets += @(	"Get-CflPlugin")



Export-ModuleMember -Cmdlet $exportedCmdlets -Function $exportedCmdlets -Variable $CflSessionManager




