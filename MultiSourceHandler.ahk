MSH_CheckExistence(Path) { ; Checks whether a file exists by attempting to open it. Should be phased out to use FileExist eventually.
    try {
        testfileobj := FileOpen(Path, "r")
        testfileobj.Close()
        Return 1
    }
    catch {
        return 0
    }
}

MSH_Locate(FileName, IncludeFileName := 0) { ; Searches among multiple source folders as outlined in RKL-SELFCONFIG to find a file of the given FileName
    loop read "RKL-SELFCONFIG" {
        LocationPath := A_LoopReadLine
        if MSH_CheckExistence(LocationPath FileName) = 1 {
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