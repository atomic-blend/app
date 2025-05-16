[Setup]
AppName=AtomicTask
AppVersion=0.7.6
DefaultDirName={pf}\AtomicTask
DefaultGroupName=AtomicTask
OutputDir=output
OutputBaseFilename=AtomicTaskInstaller
Compression=lzma
SolidCompression=yes

[Files]
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\AtomicTask"; Filename: "{app}\app.exe"
Name: "{group}\Uninstall AtomicTask"; Filename: "{uninstallexe}"