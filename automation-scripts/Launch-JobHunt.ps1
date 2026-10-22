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
	"https://recruiting.paylocity.com/recruiting/jobs/All/0eebbdf5-75ee-4aaa-8a8b-a8db5f531cd5/City-of-Valdosta",
    "https://www.lowndescounty.com/jobs.aspx", "https://careers.hprod.onehcm.usg.edu/psc/careers/CAREERS/HRMS/c/HRS_HRAM_FL.HRS_CG_SEARCH_FL.GBL?FOCUS=Applicant&SiteId=51000",
    "https://careers.sgmc.org/search/jobs?q=help+desk&location=31602",
    "https://pcom.wd108.myworkdayjobs.com/External",
	"https://www.tcsg.edu/about-tcsg/system-office-services/employment-opportunities/jobs/",
	"https://yossplatform.com/companylogin/LowndesSchools",
	"https://yossplatform.com/companylogin/Valdosta",
	"https://nfc.edu/about/employment-opportunities/employment-openings",
	"https://www.thomasu.edu/about/employment/",
	"https://yossplatform.com/companylogin/Lanier",
	"https://www.applitrack.com/colquitt/onlineapp/",
	"https://colquittemc.com/careers/employment-opportunities",
	"https://recruiting.ultipro.com/COL1042CRME/JobBoard/5ac3f35f-7e01-49ff-ad53-0acc27b4cee7/?q=&o=postedDateDesc",
	"https://pm.healthcaresource.com/cs/archbold#/search",
	"https://recruiting.paylocity.com/recruiting/jobs/All/b4319369-1767-40b0-99f1-105dfcea4a72/City-of-Thomasville",
	"https://thomascountyboc.org/human-resources/job-opportunities",
	"https://amerisbank.wd108.myworkdayjobs.com/Ameris_Bank_Careers",
	"https://secure8.entertimeonline.com/ta/MNH248.careers?careersSearch&lang=en-US",
	"https://careers.synovus.com/us/en/",
	"https://recruiting2.ultipro.com/HER1021HEFE/JobBoard/b0cf3a93-5eb3-4906-9c64-0cd512f27ecf/?q=&o=postedDateDesc",
	"https://careers.dhl.com/global/en/it-services"
)

Write-Host "Launching background browser engine..." -ForegroundColor Yellow

foreach ($URL in $TargetPortals) {
    # Trim any hidden spaces and enforce string conversion
    $CleanURL = $URL.Trim()
    Start-Process $CleanURL
    Start-Sleep -Milliseconds 400
}

Write-Host "Deployment complete. 15-Minute Hunting Window Active!" -ForegroundColor Green