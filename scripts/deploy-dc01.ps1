<#
.SYNOPSIS
    Deploys the primary Active Directory Domain Controller (DC-01) hardware template for the mleejones.lab infrastructure.
.DESCRIPTION
    This script automates the creation of a Generation 2 Hyper-V Virtual Machine, configures 
    Dynamic Memory scales, mounts the Windows Server 2022 Evaluation ISO, and targets the 
    isolated logical 'HelpDesk-Internal' virtual switch.
.NOTES
    Author: M. Lee Jones
    Date: 2026
#>

# 1. Define Environmental Variables (Adjust paths if your storage layout differs)
\$VMName      = "DC-01"
\$SwitchName  = "HelpDesk-Internal"
\$VMPath      = "C:\Hyper-V\Virtual Machines"
VHDXPath = "VMPath\$VMName\$VMName.vhdx"
\$ISOPath     = "C:\ISO-Library\Windows_Server_2022_Eval.iso" # <-- Ensure your downloaded file is here!

Write-Host "🚀 Commencing deployment sequence for logical node: \$VMName..." -ForegroundColor Cyan

# 2. Verify Internal Virtual Switch Backbone Exists
if (-not (Get-VMSwitch -Name \$SwitchName -ErrorAction SilentlyContinue)) {
    Write-Host "📡 [WARNING] Virtual Switch '\$SwitchName' not detected. Engineering interface..." -ForegroundColor Yellow
    New-VMSwitch -Name \$SwitchName -SwitchType Internal | Out-Null
    New-NetIPAddress -InterfaceAlias "vEthernet (\$SwitchName)" -IPAddress 10.0.10.1 -PrefixLength 24 | Out-Null
    Write-Host "✅ Internal Switch backbone established at gateway: 10.0.10.1" -ForegroundColor Green
}

# 3. Forge the Generation 2 Virtual Machine Hardware
Write-Host "🖥️ Provisioning Gen-2 Virtual Machine container..." -ForegroundColor Cyan
New-VM -Name \$VMName `
       -MemoryStartupBytes 2GB `
       -Generation 2 `
       -NewVHDPath \$VHDXPath `
       -NewVHDSizeBytes 60GB `
       -SwitchName \$SwitchName | Out-Null

# 4. Optimize Compute & Memory Allocation (ADHD-Friendly Infrastructure)
Write-Host "🧠 Tuning compute constraints and Dynamic Memory scales..." -ForegroundColor Cyan
Set-VMProcessor -VMName \$VMName -Count 2
Set-VMMemory -VMName VMName -DynamicMemoryEnabled True -MinimumBytes 1GB -MaximumBytes 4GB

# 5. Mount the Windows Server Installation Medium & Set Boot Authority
Write-Host "💿 Mounting Windows Server installation media..." -ForegroundColor Cyan
Add-VMDvdDrive -VMName VMName -Path ISOPath | Out-Null

DVD = Get-VMDvdDrive -VMName VMName
Set-VMBootOrder -VMName VMName -BootOrder DVD

Write-Host "🎯 [SUCCESS] \$VMName hardware configuration deployment 100% complete!" -ForegroundColor Green
Write-Host "👉 Action Required: Open Hyper-V Manager, double-click '\$VMName', hit 'Start', and press any key to boot the installer." -ForegroundColor Quick
