# Created by Brandon Hatfield
# 20230901
# This script is another tweak to the original Computer_Info powershell script
# that takes into account your organization may not allow the Add-Type .Net
# Framework class. This will effectively just print the info into a text file
# on your current user desktop.

$ComputerName = (HostName)
$SerialNumber = (Get-WmiObject -class win32_bios).SerialNumber
$MacAddress = (Get-NetAdapter | Where-object {$_.Status -match 'Up'}).MacAddress
$IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred).IPAddress.Split()[0]

Write-Output "Computer Name : $ComputerName `nSerial # $SerialNumber `nMac Adress : $MacAddress `nIP Address $IPAddress" > C:\Users\$env:USERNAME\Desktop\Computer_Info.txt
# Write-Output "You can uncomment this line and add your own personal message that will show in the powershell terminal window"
cmd /c pause