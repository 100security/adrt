<# 
.NAME
    ADRT - Active Directory Report Tool
.DESCRIPTION
    List all Report Options
.EXAMPLE
    PS C:\adrt> .\adrt.ps1
.NOTES
    Name: Marcos Henrique
	E-mail: marcos@100security.com.br
.LINK
    WebSite: http://www.100security.com.br
	Facebook: https://www.facebook.com/seguranca.da.informacao
	Twitter: https://twitter.com/100Security
	GitHub: https://www.github.com/100security
	Youtube: https://www.youtube.com/user/videos100security
#>

$directorypath = (Get-Item -Path ".\").FullName
$config = "config\config.txt"
$delete = "$directorypath\ad-reports"

function Show-Menu
{
	param (
		[string]$Title = 'ADRT'
	)
	cls
	Write-Host ""  
	Write-Host " + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +"
	Write-Host " "    
	Write-Host "                               ADRT - Active Directory Report Tool                                "    
	Write-Host " "    
	Write-Host " + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +"
	Write-Host " "    
	Write-Host "                                   [ 00 ] - Config Tool"
	Write-Host "                                   [ 01 ] - All Users"
	Write-Host "                                   [ 02 ] - Domain Admins"
	Write-Host "                                   [ 03 ] - Enterprise Admins"
	Write-Host "                                   [ 04 ] - Disabled Users" 
	Write-Host "                                   [ 05 ] - Last Logon"
	Write-Host "                                   [ 06 ] - Password Never Expires"
	Write-Host "                                   [ 07 ] - All Groups" 
	Write-Host "                                   [ 08 ] - All Member Groups" 
	Write-Host "                                   [ 09 ] - All OUs"
	Write-Host "                                   [ 10 ] - All Computers"
	Write-Host "                                   [ 11 ] - All Servers"   
	Write-Host "                                   [ 12 ] - Domain Controllers"
	Write-Host "                                   [ 13 ] - All GPOs"
	Write-Host "                                   [ 14 ] - Inventory"
	Write-Host "                                   [ 15 ] - All Reports"  
	Write-Host "                                   [ 16 ] - Delete old Reports"  
	Write-Host "                                   [ 99 ] - Exit"
	Write-Host ""	 
	Write-Host " + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +"
	Write-Host ""  
}
do
{
	Show-Menu
	$input = Read-Host "Enter a number"
	switch ($input)
	{ '00' {
	cls
	Invoke-Item $directorypath\$config
	} '01' {
	cls
	.\ad-users.ps1
	} '02' {
	cls
	.\ad-admins.ps1
	} '03' {
	cls
	.\ad-enterprise-admins.ps1
	} '04' {
	cls
	.\ad-disabled.ps1
	} '05' {
	cls
	.\ad-lastlogon.ps1
	} '06' {
	cls
	.\ad-neverexpires.ps1
	} '07' {
	cls
	.\ad-groups.ps1
	} '08' {
	cls
	.\ad-membergroups.ps1
	} '09' {
	cls
	.\ad-ous.ps1
	} '10' {
	cls
	.\ad-computers.ps1
	} '11' {
	cls
	.\ad-servers.ps1
	} '12' {
	cls
	.\ad-dcs.ps1
	} '13' {
	cls
	.\ad-gpos.ps1
	} '14' {
	cls
	.\ad-inventory.ps1
	} '15' {
	cls
	.\ad-all.ps1
	} '16' {
	cls
	Remove-Item $delete\ad-users\* -Recurse -Force
	Remove-Item $delete\ad-admins\* -Recurse -Force
	Remove-Item $delete\ad-enterprise-admins\* -Recurse -Force
	Remove-Item $delete\ad-disabled\* -Recurse -Force
	Remove-Item $delete\ad-lastlogon\* -Recurse -Force
	Remove-Item $delete\ad-neverexpires\* -Recurse -Force
	Remove-Item $delete\ad-groups\* -Recurse -Force
	Remove-Item $delete\ad-membergroups\* -Recurse -Force
	Remove-Item $delete\ad-ous\* -Recurse -Force
	Remove-Item $delete\ad-computers\* -Recurse -Force
	Remove-Item $delete\ad-servers\* -Recurse -Force
	Remove-Item $delete\ad-dcs\* -Recurse -Force
	Remove-Item $delete\ad-gpos\* -Recurse -Force
	Remove-Item $delete\ad-inventory\* -Recurse -Force
	Remove-Item $delete\ad-all\* -Recurse -Force
	} '99' {
     return
		}
    }
    Write-Host ""  
    Write-Host " + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +"
    Write-Host " "    
    Write-Host "                                       Successfully executed!"    
    Write-Host " "    
    Write-Host " + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +"
    Write-Host " "    
	pause
}
until ($input -eq '99')