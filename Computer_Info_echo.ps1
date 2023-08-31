# Created by Brandon Hatfield
# 20230831
# This script is a small tweak to the original Computer_Info powershell script
# that takes into account your organization may not allow the Add-Type .Net
# Framework class. This will effectively just print the info in your shell
# window and ask for a keypress to exit.

$ComputerName = (HostName)
$SerialNumber = (Get-WmiObject -class win32_bios).SerialNumber
$MacAddress = (Get-NetAdapter | Where-object {$_.Status -match 'Up'}).MacAddress
$IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred).IPAddress

Write-Output "Computer Name : $ComputerName `nSerial # $SerialNumber `nMac Adress : $MacAddress `nIP Address $IPAddress","Computer Info"
# Write-Output "Remove the # symbol from the beggining of this line and eplace this quote with your personal message here"
cmd /c pause