function Install-Confluence
{
	Uninstall-Confluence
	#cp '~\Documents\Visual Studio 2012\Projects\PoshConfluence\Confluence\bin\Debug\' ~\Documents\WindowsPowerShell\Modules -Force -Recurse
	cp '~\Documents\Github\PoshConfluence\Confluence\bin\Debug\' ~\Documents\WindowsPowerShell\Modules -Force -Recurse
	ren ~\Documents\WindowsPowerShell\Modules\Debug PoshConfluence
}

function Uninstall-Confluence
{
	rmdir ~\Documents\WindowsPowerShell\Modules\PoshConfluence -ErrorAction Continue -Recurse
}