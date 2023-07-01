SetTitleMatchMode 2
#HotIf WinActive("Visual Studio Code") ; Ensures hotkey only runs in Visual Studio Code
if FileExist("RKL-SELFCONFIG") = "" {
    FileOpen("RKL-SELFCONFIG", "w").Close()
    FileAppend(A_WorkingDir, "RKL-SELFCONFIG")
    MsgBox "No RKL-SELFCONFIG found, created in " A_WorkingDir "."
}
;SelfConfig := FileOpen("RKL-SELFCONFIG", "rw")

CheckExistence(Path) {
    try {
        testfileobj := FileOpen(Path, "r")
        testfileobj.Close()
        Return 1
    }
    catch {
        return 0
    }
}

Locate(FileName, IncludeFileName := 0) {
    loop read "RKL-SELFCONFIG" {
        LocationPath := A_LoopReadLine
        if CheckExistence(LocationPath FileName) = 1 {
            if IncludeFileName = 1 {
                Return LocationPath FileName
            } else {
                Return LocationPath
            }
        }    
    }
    
    MsgBox "File not found. Consider adding its source to RKL-SELFCONFIG."
    return "NO_PATH_FOUND"

}

F5:: {
    Title := WinGetTitle("Visual Studio Code")
    TargetFile := SubStr(Title, 1, (InStr(Title, ".ahk")) + 3) ; Parses window title to extract name of current file
    Path := Locate(TargetFile, 1)
    try
        global Path    
        Run Path ; Attempts to run that file from the default directory my AHK scripts are stored in
    catch
        MsgBox "File " TargetFile " not located. Check folder path to AHK script storage in line 7 of this script." ; Complains if file not found
}