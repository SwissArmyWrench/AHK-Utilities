SetTitleMatchMode 2
#HotIf WinActive("Visual Studio Code") ; Ensures hotkey only runs in Visual Studio Code
F5:: {
    Title := WinGetTitle("Visual Studio Code")
    TargetFile := SubStr(Title, 1, (InStr(Title, ".ahk")) + 3) ; Parses window title to extract name of current file
    try
        Run TargetFile, "ENTER_PATH_TO_AHK_SCRIPT_STORAGE_HERE" ; Attempts to run that file from the default directory my AHK scripts are stored in
    catch
        MsgBox "File not located. Check folder path to AHK script storage in line 7 of this script." ; Complains if file not found
}