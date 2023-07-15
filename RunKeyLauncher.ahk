
#Include Personal/MultiSourceHandler.ahk ; Currently using separate clone of MSH while development is underway
#SingleInstance
SetTitleMatchMode 2
#HotIf WinActive("Visual Studio Code") ; Ensures hotkey only runs in Visual Studio Code

; If RKL's configuration file does not exist in this directory, create it.
if FileExist("RKL-SELFCONFIG") = "" {
    FileOpen("RKL-SELFCONFIG", "w").Close()
    FileAppend(A_WorkingDir, "RKL-SELFCONFIG")
    MsgBox "No RKL-SELFCONFIG found, created in " A_WorkingDir "."
}

F5:: {
    Title := WinGetTitle("Visual Studio Code") ; Gets full window title
    TargetFile := SubStr(Title, 1, (InStr(Title, ".ahk")) + 3) ; Parses window title to extract name of current file
    Path := MSH_Locate(TargetFile, 1) ; Finds the path to the current file using the MSH_Locate method from the MultiSourceHandler library.
    try
        global Path    
        Run Path ; Attempts to run that file from the default directory my AHK scripts are stored in
    catch
        MsgBox "File " TargetFile " not located. Check folder path to AHK script storage in line 7 of this script." ; Complains if file not found
}