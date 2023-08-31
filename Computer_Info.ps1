# Created by Brandon Hatfield
# 20230829
# This script was created to facilitate gathering of basic computer information on an enterprise network
# and will create a message box with the info

Add-Type -AssemblyName PresentationFramework

$ComputerName = (HostName)
$SerialNumber = (Get-WmiObject -class win32_bios).SerialNumber
$MacAddress = (Get-NetAdapter | Where-object {$_.Status -match 'Up'}).MacAddress
$IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred).IPAddress

[System.Windows.MessageBox]::Show("Computer Name : $ComputerName `nSerial # $SerialNumber `nMac Adress : $MacAddress `nIP Address $IPAddress","Computer Info")