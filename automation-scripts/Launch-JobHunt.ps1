<#
.SYNOPSIS
    Automates morning infrastructure deployment of geographic target job portals.
.DESCRIPTION
    Launches a hardcoded array of targeted regional public sector and institutional 
    employment portals within a specified driving radius. Designed to eliminate 
    administrative friction, platform drift, and time blindness during daily pipeline audits.
.PARAMETER TargetPortals
    An array of explicitly declared, deep-linked URLs representing secure hunting perimeters.
.EXAMPLE
    .\Launch-JobHunt.ps1
.NOTES
    Author: Marcellous Lee Jones
    Version: 1.0
    Target Perimeter: Valdosta-Thomasville-Tifton-Lake City (60-minute radius)
    Exclusions: Third-party scraping aggregators (Dice.com)
#>
# Launch-JobHunt.ps1
# Purpose: Single-click execution to open direct, deep-linked job filters.

Write-Host "Initializing Pipeline Deployment..." -ForegroundColor Cyan

# Force explicit array string separation using trailing commas
$TargetPortals = @(
    "https://www.governmentjobs.com", "https://recruiting.paylocity.com/recruiting/jobs/All/0eebbdf5-75ee-4aaa-8a8b-a8db5f531cd5/City-of-Valdosta",
    "https://www.lowndescounty.com/jobs.aspx", "https://careers.hprod.onehcm.usg.edu/psc/careers/CAREERS/HRMS/c/HRS_HRAM_FL.HRS_CG_SEARCH_FL.GBL?Page=HRS_APP_SCHJOB_FL&Action=U",
    "https://careers.sgmc.org/search/jobs?q=help+desk&location=31602",
    "https://pcom.wd108.myworkdayjobs.com/External"
)

Write-Host "Launching background browser engine..." -ForegroundColor Yellow

foreach ($URL in $TargetPortals) {
    # Trim any hidden spaces and enforce string conversion
    $CleanURL = $URL.Trim()
    Start-Process $CleanURL
    Start-Sleep -Milliseconds 300
}

Write-Host "Deployment complete. 15-Minute Hunting Window Active!" -ForegroundColor Green