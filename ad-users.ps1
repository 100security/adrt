<# 
.NAME
    ADRT - Active Directory Report Tool
.DESCRIPTION
    Extract the complete list of All Users.
.EXAMPLE
    PS C:\adrt> .\ad-users.ps1
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

$report = $null
$table = $null
$date = Get-Date -format "yyyy-MM-dd"
$mounth = Get-Date -format "MMM"
$directorypath = (Get-Item -Path ".\").FullName
$path = "ad-reports\ad-users"
#$html = "$path\ad-users-$date.html"
#$csv = "$path\ad-users-$date.csv"
$html = "$path\ad-users.html"
$csv = "$path\ad-users.csv"

#-- All Users
$t_u = (Get-ADUser -filter *).count
#-- PasswordNeverExpires
$t_pne = (Get-ADUser -filter * -properties PasswordNeverExpires | where { $_.PasswordNeverExpires -eq "true" } | where {$_.enabled -eq "true"} ).count
#-- Disabled Users
$t_du = (Search-ADAccount -AccountDisabled).count
$domain = (Get-ADDomain).Forest

# Config
$config = Get-Content (JOIN-PATH $directorypath "config\config.txt")
$company = $config[7]
$owner = $config[9]

#-- Import Module
Import-Module ActiveDirectory

#-- Show Total
$table += "<center><h3><b>Total Users: <font color=red>$t_u</font> - PasswordNeverExpires: <font color=red>$t_pne</font> - Disabled Users: <font color=red>$t_du</font></b></h3></center>"

#-- Filter
$users = @(Get-ADUser -filter * -Properties Company, St, SamAccountName, Name, Mail, Department, Title, PasswordNeverExpires, Enabled, Created, Modified, Info)

$result = @($users | Select-Object Company, St, SamAccountName, Name, Mail, Department, Title, PasswordNeverExpires, Enabled, Created, Modified, Info)

#-- Order by (A-Z)
$a = 'Company'
$b = 'St' 
$c = 'Department' 
$d = 'Info' 
$order = ($a | Sort-Object), ($b | Sort-Object), ($c | Sort-Object), ($d | Sort-Object)
$result = $result | Sort $order

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
		<font face='Calibri' size='5px'><b>Active Directory - All Users</b></font>
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
$message = $message + "<tr><td height='40'>Total Users</td><td>$t_u</td></tr>"
$message = $message + "<tr><td height='40'>Password Users Never Expires</td><td>$t_pne</td></tr>"
$message = $message + "<tr><td height='40'>Disabled Users</td><td>$t_du</td></tr>"
$message = $message + "<tr><td colspan='2' bgcolor='#DDEBF7' height='40'><b>Information Security</b></td></tr>"
$message = $message + "</table>"

$report = $format + $title + $table + $footer

#-- Generate HTML file
$report | Out-File $html -Encoding Utf8

#-- Export to CSV
$result | Sort Company | Export-Csv $csv -NoTypeInformation -Encoding Utf8

#-- Send report by email
#$Subject = "[ Report-$mounth ] Active Directory - All Users"
#$SmtpServer	= $config[11]
#$Port = $config[13]
#$From = $config[15]
#$To = $config[17]

#Send-MailMessage -From $From -To $To -Subject $Subject -Attachments $html,$csv -bodyashtml -Body $message -SmtpServer $SmtpServer -Port $Port

cls