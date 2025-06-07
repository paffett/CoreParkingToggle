# CoreParkingToggle

A PowerShell-based tool to easily toggle Windows CPU core parking settings between disabled (100% minimum cores un-parked) and default (0% minimum cores un-parked).

---

## Features

- **Disable Core Parking**: Set the minimum cores-to-park setting to 100%, effectively disabling core parking on both AC and DC power.  
- **Revert Core Parking**: Restore the default minimum cores-to-park setting (0%) on both AC and DC power.  
- **Interactive Menu**: Choose action by pressing `1` (disable) or `2` (revert).  
- **Administrator Check**: Automatically verifies that the script is run with elevated privileges.  
- **.bat Wrapper**: Includes a batch file to bypass execution policy and launch the script without modifying system settings.  

---

## Files

- `CoreParkingToggle.ps1`  
  - PowerShell script that toggles core parking settings.  
- `CoreParkingToggle.bat`  
  - Batch wrapper to run the PowerShell script with `-ExecutionPolicy Bypass`.  

---

## Prerequisites

- Windows 10, 11, or later.  
- PowerShell 5.1 or PowerShell Core.  
- Administrator privileges.  

---

## Installation

1. Clone or download this repository:
   ```powershell
   git clone https://github.com/paffett/CoreParkingToggle.git
   cd CoreParkingToggle
