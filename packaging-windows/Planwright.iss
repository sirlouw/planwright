; Inno Setup script for the Planwright Windows installer.
; Built by .github/workflows/build.yml, which passes:
;   /DAppVersion=<version from Cargo.toml>  /DSourceExe=<path to planwright.exe>

#ifndef AppVersion
  #define AppVersion "0.0.0"
#endif
#ifndef SourceExe
  #define SourceExe "planwright.exe"
#endif

[Setup]
AppId={{C14C423F-CD3F-4D33-AD12-3FD0336D4373}
AppName=Planwright
AppVersion={#AppVersion}
AppVerName=Planwright {#AppVersion}
AppPublisher=Planwright
DefaultDirName={autopf}\Planwright
DefaultGroupName=Planwright
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\Planwright.exe
OutputBaseFilename=Planwright-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequiredOverridesAllowed=dialog
ChangesAssociations=yes
CloseApplications=yes

[Languages]
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "{#SourceExe}"; DestDir: "{app}"; DestName: "Planwright.exe"; Flags: ignoreversion

[Icons]
Name: "{group}\Planwright"; Filename: "{app}\Planwright.exe"
Name: "{group}\{cm:UninstallProgram,Planwright}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\Planwright"; Filename: "{app}\Planwright.exe"; Tasks: desktopicon

[Registry]
; double-clicking a .plan file opens it in Planwright
Root: HKA; Subkey: "Software\Classes\.plan"; ValueType: string; ValueName: ""; ValueData: "Planwright.Project"; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\Planwright.Project"; ValueType: string; ValueName: ""; ValueData: "Planwright Project"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\Planwright.Project\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\Planwright.exe,0"
Root: HKA; Subkey: "Software\Classes\Planwright.Project\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Planwright.exe"" ""%1"""

[Run]
Filename: "{app}\Planwright.exe"; Description: "{cm:LaunchProgram,Planwright}"; Flags: nowait postinstall skipifsilent
