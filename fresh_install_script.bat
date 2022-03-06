@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM *** Install Programs ***
winget install --id=Google.Chrome -e  && winget install --id=vim.vim -e  && winget install --id=qBittorrent.qBittorrent -e  && winget install --id=Adobe.Acrobat.Reader.64-bit -e  && winget install --id=Mozilla.Thunderbird -e  && winget install --id=Notepad++.Notepad++ -e  && winget install --id=Oracle.VirtualBox -e  && winget install --id=TimKosse.FileZilla.Client -e  && winget install --id=PeterPawlowski.foobar2000 -e  && winget install --id=REALiX.HWiNFO -e  && winget install --id=TheDocumentFoundation.LibreOffice -e  && winget install --id=Lexikos.AutoHotkey -e  && winget install --id=VideoLAN.VLC -e  && winget install --id=7zip.7zip -e  && winget install --id=Python.Python.3 -e  && winget install --id=Rufus.Rufus -e  && winget install --id=PrestonN.FreeTube -e 

REM *** Remove Programs ***
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"

REM *** Show file extensions in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f

REM *** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
echo OneDrive has been removed. Windows Explorer needs to be restarted.
pause
start /wait TASKKILL /F /IM explorer.exe
start explorer.exe