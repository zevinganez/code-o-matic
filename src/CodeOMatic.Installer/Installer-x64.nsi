Name "CodeOMatic"
OutFile "CodeOMatic-x64.exe"
InstallDir "$PROGRAMFILES64\PostSharp 1.0"
RequestExecutionLevel admin

Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "PostSharp"
	SetOutPath $TEMP
	File PostSharp-1.0.12.469-Release-x64.msi
	ExecWait 'msiexec /i "$TEMP\PostSharp-1.0.12.469-Release-x64.msi" /passive INSTALLLOCATION="$INSTDIR"'
	Delete "$TEMP\PostSharp-1.0.12.469-Release-x64.msi"
SectionEnd

Section "Code-o-matic"
	SetOutPath $INSTDIR
	File CodeOMatic.Validation.psplugin
	File CodeOMatic.Validation.CompileTime.dll
	File CodeOMatic.Validation.Core.dll
	File CodeOMatic.Core.dll
	File CodeOMatic.Logging.psplugin
	File CodeOMatic.Logging.dll
	File CodeOMatic.Logging.CompileTime.dll
	File log4net.dll

	SetOutPath $INSTDIR\CodeOMatic
	File CodeOMatic.Validation.Core.dll
	File CodeOMatic.Validation.dll
	File CodeOMatic.Core.dll
	File CodeOMatic.Web.dll
	File CodeOMatic.Logging.dll
	File log4net.dll
	File PostsharpRequired.cs
	
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CodeOMatic" "DisplayName" "Code-o-matic"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CodeOMatic" "UninstallString" '"$INSTDIR\uninstall.exe"'
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CodeOMatic" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CodeOMatic" "NoRepair" 1
	WriteUninstaller "uninstall.exe"
SectionEnd

Section "Uninstall"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CodeOMatic"

	Delete "$INSTDIR\CodeOMatic.Validation.psplugin"
	Delete "$INSTDIR\CodeOMatic.Validation.CompileTime.dll"
	Delete "$INSTDIR\CodeOMatic.Validation.Core.dll"
	Delete "$INSTDIR\CodeOMatic.Core.dll"
	Delete "$INSTDIR\CodeOMatic.Logging.dll"
	Delete "$INSTDIR\CodeOMatic.Logging.CompileTime.dll"
	Delete "$INSTDIR\log4net.dll"

	Delete "$INSTDIR\CodeOMatic\CodeOMatic.Validation.Core.dll"
	Delete "$INSTDIR\CodeOMatic\CodeOMatic.Validation.dll"
	Delete "$INSTDIR\CodeOMatic\CodeOMatic.Web.dll"
	Delete "$INSTDIR\CodeOMatic\CodeOMatic.Core.dll"
	Delete "$INSTDIR\CodeOMatic\PostsharpRequired.cs"
	Delete "$INSTDIR\CodeOMatic\CodeOMatic.Logging.dll"
	Delete "$INSTDIR\CodeOMatic\CodeOMatic.Logging.CompileTime.dll"
	Delete "$INSTDIR\CodeOMatic\log4net.dll"

	Delete "$INSTDIR\uninstall.exe"

	RMDir "$INSTDIR\CodeOMatic"
SectionEnd
