<#
.SYNOPSIS
  Toggle Core Parking “minimum cores to park” between 100% (disabled) and 0% (default).

.DESCRIPTION
  - Press 1 to set “minimum cores to park” to 100% (disable core parking).
  - Press 2 to set it back to 0% (restore default).
  - Requires running as Administrator.
#>

# Ensure we’re elevated
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You must run this script as Administrator."
    Exit 1
}

# Prompt user
Write-Host "Core Parking Toggle"
Write-Host "1) Turn off Core Parking (set min cores to park = 100%)"
Write-Host "2) Revert to Default (set min cores to park = 0%)"
$choice = Read-Host "Enter choice [1 or 2]"

switch ($choice) {
    '1' { $value = 100; $action = 'Disabling';    $desc = '100%' }
    '2' { $value =   0; $action = 'Reverting';     $desc = '0%'   }
    default {
        Write-Error "Invalid choice. Please run again and enter 1 or 2."
        Exit 1
    }
}

# Extract the active scheme GUID
$guid = (powercfg /getactivescheme) -replace '.*:\s+([A-F0-9\-]+).*', '$1'

Write-Host "$action Core Parking: setting minimum-cores-to-park to $desc"
# Core Parking “minimum cores to park” setting GUID
$subGroup  = 'SUB_PROCESSOR'
$settingID = '0cc5b647-c1df-4637-891a-dec35c318583'

# Apply to AC and DC
powercfg /setacvalueindex $guid $subGroup $settingID $value
powercfg /setdcvalueindex $guid $subGroup $settingID $value

# Re-activate the scheme
powercfg /setactive $guid

# Verify and display
Write-Host "`nVerifying current value..."
powercfg /query $guid $subGroup $settingID

# Check if the command succeeded
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to query the setting. Please check your permissions or the GUID."
    Exit 1
}