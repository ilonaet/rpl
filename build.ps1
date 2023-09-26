param(
    [string]$torchExe = "\\amr.corp.intel.com\ec\proj\MDO\Global\MIG\Torch\Prod\CLI\Torch.exe",
    [string]$solutionLocal = "CommonOnly.sln",
	[string]$restoreExe = "\\ger.corp.intel.com\ec\proj\mdl\ha\intel\engineering\dev\sctp\RPL_validators\RestoreNugets\RestoreNugets.exe"
)

write "Starting to run"
& $restoreExe (Get-Item .).FullName\RaptorLake.sln
& $torchExe install
& $torchExe build -s "RaptorLake.sln" -p "POR_TP\RPL_1ST_SILICON\RPL_1ST_SILICON.tpproj"

write "build exit with:$LASTEXITCODE"

exit $LASTEXITCODE