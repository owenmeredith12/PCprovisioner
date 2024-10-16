
#pc provisioning script------------------------------------------------------

#variables-----------------------------------------------------------
$pcname = Read-Host "Enter the pc name"
#$Key = Read-Host "Enter windows activation key"
#Write-Host "Please confirm key $key"

#install python and packages needed
Write-Host "Installing Python"
Start-Process "D:\pythoninstaller.exe" /s
start-Sleep -Seconds 30
$env:Path += ";C:\Users\Owner\AppData\Local\Programs\Python\Python313\Scripts\"
$env:Path += ";C:\Users\Owner\AppData\Local\Programs\Python\Python313\"
pip install pyautogui
pip install pillow
pip install keyboard

#Update Windows-------------------------------------------------------
Write-Host "Updating Windows"
Install-Module -Name PSWindowsUpdate -Force -Confirm:$false
Import-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot

#sync time------------------------------------------------------------
Write-Host "Syncing Time"
w32tm /resync /force

#rename pc------------------------------------------------------------
Write-Host "Renaming PC"
Rename-Computer -NewName $pcname

#activate windows-----------------------------------------------------
#wsl -set-version Ubuntu-20.04 2
#slmgr /ipk $Key

#install graphics drivers---------------------------------------------
Write-Host "Updating Graphics Driver"
Start-Process "D:\nvidiaDrivers\4070super\setup.exe" /s
start-sleep -Seconds 100

#furmark--------------------------------------------------------------
Write-host "Running Benchmarks"
Start-Process "d:\FurMark.exe - Shortcut.lnk"
python furmark.py

#burn test-----------------------------------------------------------
Start-Process "D:\HWiNFO64 - Shortcut.lnk"
python hwinfo.py

Start-Process "D:\IntelBurnTestV2 - Shortcut.lnk"
python burntest.py
