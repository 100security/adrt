<# 
.NAME
    ADRT - Active Directory Report Tool
.DESCRIPTION
    Extract the complete list of All.
.EXAMPLE
    PS C:\adrt> .\ad-all.ps1
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

# All Users
.\ad-users.ps1
# Domain Admins
.\ad-admins.ps1
# Disabled Users
.\ad-disabled.ps1
# LastLogon
.\ad-lastlogon.ps1
# Password Never Expires
.\ad-neverexpires.ps1
# All Groups
.\ad-groups.ps1
# Member Groups
.\ad-membergroups.ps1
# All OUs
.\ad-ous.ps1
# All Computers
.\ad-computers.ps1
# All Servers
.\ad-servers.ps1
# Domain Controllers
.\ad-dcs.ps1
# All GPOs
.\ad-gpos.ps1
# Inventory
.\ad-inventory.ps1
#-------------------------------------------------------------------#
$report = $null
$table = $null
$date = Get-Date -format "yyyy-M-d"
$mounth = Get-Date -format "MMM"
$directorypath = (Get-Item -Path ".\").FullName
$path = "ad-reports\ad-all"
new-item -type directory -path "$path\ad-$date" -Force

#-- All Users
$t_u = (Get-ADUser -filter *).count
#-- All Disabled Users
$t_du = (Search-ADAccount -AccountDisabled -UsersOnly).count
#-- LastLogon
$days = 90
$timestamp = (Get-Date).Adddays(-($days))
$t_ll = (Get-ADUser -Filter {LastLogonTimeStamp -lt $timestamp -and enabled -eq $true} -Properties LastLogonTimeStamp).count  
#-- PasswordNeverExpires
$t_pne = (Get-ADUser -filter * -properties PasswordNeverExpires | where { $_.PasswordNeverExpires -eq "true" } | where {$_.enabled -eq "true"} ).count
#-- All Groups
$t_g = (Get-ADGroup -Filter {name -like "*"}).count 
#-- All OUs 
$t_ous = (Get-ADOrganizationalUnit -Filter {name -like "*"}).count 
#-- All Computers
$t_c = (Get-ADComputer -Filter { OperatingSystem -NotLike '*Windows Server*' }).count
#-- All Server
$t_s = (Get-ADComputer -Filter { OperatingSystem -Like '*Windows Server*' }).count
#-- Computers + Servers
$t_cs = (Get-ADComputer -Filter * -Property *).count
#-- Domain Controllers
$t_dcs = (Get-ADDomainController -Filter *).count 
#-- All GPOs
$t_gpos = (Get-GPO -All).count 
#-- Domain Admins
$t_da = (Get-ADGroupMember -Identity "Domain Admins").count
 
$domain = (Get-ADDomain).Forest

# Config
$config = Get-Content (JOIN-PATH $directorypath "config\config.txt")
$company = $config[7]
$owner = $config[9]

#-- Import Module
Import-Module ActiveDirectory

#-- Show Total
$table += "<center><h3><b>Total Groups: <font color=red>$t_g</font></b></h3></center>"

#-- Filter
#$groups = @(Get-ADGroup -Filter {name -like "*"} -Properties Description | Select Name, Description)

$result = @(Select-Object @{Label="Usuarios";Expression={$_.t_u}})

#-- Order by (A-Z)
$result = $result | Sort "Usuarios"

#-- Display result on screen
#$result | ft -auto 

$table += $result | ConvertTo-Html -Fragment
 
$format=
		"
		<html>
		<body>
		<title>$company</title>
		<style>
		BODY{font-family: Calibri; font-size: 12pt;}
		TABLE{border: 1px solid black; border-collapse: collapse; font-size: 12pt; text-align:center;margin-left:auto;margin-right:auto; width='1000px';}
		TH{border: 1px solid black; background: #F9F9F9; padding: 5px;}
		TD{border: 1px solid black; padding: 5px;}
		H3{font-family: Calibri; font-size: 12pt;}
		</style> 
		"
$title=
		"
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
		<tr>
		<td bgcolor='#F9F9F9'>
		<font face='Calibri' size='5px'><b>Active Directory - All</b></font>
		<H3 align='center'>Company: <font color=red>$company</font> - Domain: <font color=red>$domain</font> - Date: <font color=red>$date</font> - Owner: <font color=red>$owner</font></H3>
		</td>
		</tr>
		</table>
		</body>
		</html>
		"
$footer=
		"
		<br><br>
		<table width='100%' border='0' cellpadding='0' cellspacing='0'>
		<tr>
		<td bgcolor='#F9F9F9'>
		<font face='Calibri' size='2px'>ADRT - Active Directory Report Tool</font>
		</td>
		</tr>
		</table>
		"
$message = "</table><style>"
$message = $message + "BODY{font-family: Calibri;font-size:16;font-color: #000000}"
$message = $message + "TABLE{margin-left:auto;margin-right:auto;width: 800px;border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$message = $message + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color: #F9F9F9;text-align:center;}"
$message = $message + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;text-align:center;}"
$message = $message + "</style>"
$message = $message + "<table width='300px' heigth='500px' align='center'>"
$message = $message + "<tr><td colspan='2' bgcolor='#DDEBF7' height='40'><b>Active Directory</b></td></tr>"
$message = $message + "<tr><td bgcolor='#F9F9F9' height='40'>Description</td><td bgcolor='#F9F9F9' height='40'>Total</td></tr>"
$message = $message + "<tr><td height='40'>Users</td><td>$t_u</td></tr>"
$message = $message + "<tr><td height='40'>Disabled Users</td><td>$t_du</td></tr>"
$message = $message + "<tr><td height='40'>Last Logon $days days</td><td>$t_ll</td></tr>"
$message = $message + "<tr><td height='40'>Passwords Never Expires</td><td>$t_pne</td></tr>"
$message = $message + "<tr><td height='40'>Groups</td><td>$t_g</td></tr>"
$message = $message + "<tr><td height='40'>OUs</td><td>$t_ous</td></tr>"
$message = $message + "<tr><td height='40'>Computers</td><td>$t_c</td></tr>"
$message = $message + "<tr><td height='40'>Servers</td><td>$t_s</td></tr>"
$message = $message + "<tr><td height='40'>Computers + Servers</td><td>$t_cs</td></tr>"
$message = $message + "<tr><td height='40'>Domain Controllers</td><td>$t_dcs</td></tr>"
$message = $message + "<tr><td height='40'>GPOs</td><td>$t_gpos</td></tr>"
$message = $message + "<tr><td height='40'>Domain Admins</td><td>$t_da</td></tr>"
$message = $message + "<tr><td colspan='2' bgcolor='#DDEBF7' height='40'><b>Information Security</b></td></tr>"
$message = $message + "</table>"

$report = $format + $title + $table + $footer

$destination = "$path\ad-$date"

$01 = "$directorypath\ad-reports\ad-users\ad-users-$date.html"
$02 = "$directorypath\ad-reports\ad-admins\ad-admins-$date.html"
$03 = "$directorypath\ad-reports\ad-disabled\ad-disabled-$date.html"
$04 = "$directorypath\ad-reports\ad-lastlogon\ad-lastlogon-$date.html"
$05 = "$directorypath\ad-reports\ad-neverexpires\ad-neverexpires-$date.html"
$06 = "$directorypath\ad-reports\ad-groups\ad-groups-$date.html"
$07 = "$directorypath\ad-reports\ad-membergroups\ad-membergroups-$date.html"
$08 = "$directorypath\ad-reports\ad-ous\ad-ous-$date.html"
$09 = "$directorypath\ad-reports\ad-computers\ad-computers-$date.html"
$10 = "$directorypath\ad-reports\ad-servers\ad-servers-$date.html"
$11 = "$directorypath\ad-reports\ad-dcs\ad-dcs-$date.html"
$12 = "$directorypath\ad-reports\ad-gpos\ad-gpos-$date.html"
$13 = "$directorypath\ad-reports\ad-gpos\gpos-html-$date.zip"
$14 = "$directorypath\ad-reports\ad-inventory\ad-inventory-$date.html"

Copy-Item -Path $01 -Filter *.html -Destination $destination -Force
Copy-Item -Path $02 -Filter *.html -Destination $destination -Force
Copy-Item -Path $03 -Filter *.html -Destination $destination -Force
Copy-Item -Path $04 -Filter *.html -Destination $destination -Force
Copy-Item -Path $05 -Filter *.html -Destination $destination -Force
Copy-Item -Path $06 -Filter *.html -Destination $destination -Force
Copy-Item -Path $07 -Filter *.html -Destination $destination -Force
Copy-Item -Path $08 -Filter *.html -Destination $destination -Force
Copy-Item -Path $09 -Filter *.html -Destination $destination -Force
Copy-Item -Path $10 -Filter *.html -Destination $destination -Force
Copy-Item -Path $11 -Filter *.html -Destination $destination -Force
Copy-Item -Path $12 -Filter *.html -Destination $destination -Force
Copy-Item -Path $13 -Filter *.zip -Destination $destination -Force
Copy-Item -Path $14 -Filter *.html -Destination $destination -Force

#-- Send report by email
$Subject = "[ Report-$mounth ] Active Directory - All"
$SmtpServer	= $config[11]
$Port = $config[13]
$From = $config[15]
$To = $config[17]

Send-MailMessage -From $From -To $To -Subject $Subject -Attachments $01,$02,$03,$04,$05,$06,$07,$08,$09,$10,$11,$12,$13,$14 -bodyashtml -Body $message -SmtpServer $SmtpServer -Port $Port

cls
Invoke-Item $directorypath\index.html