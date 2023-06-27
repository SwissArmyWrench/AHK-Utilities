#Warn VarUnset, Off
SetTitleMatchMode 2 
BracketEnableFlag := 1 ; This flag is set to 0 at lines 12 and 25 to prevent the second set of actions from executing at the same time.
#HotIf WinActive(" - Visual Studio Code") or WinActive("Standard Notes") ; Sets these hotkeys to only be active in VSCode and Standard Notes. This will be made more user friendly in a future update.
~LShift:: { ; Defines a right-to-left "rolling" behavior to type the { character.
    KeyWait "RShift", "D" ; Waits for the key to be depressed instead of released (as is the default)
    If GetKeyState("LShift", "P") { ; if Left Shift is still pressed at this point, we are still in the roll and the script now waits it to be released, otherwise it returns and cancels the rest of the code for that hotkey
        KeyWait "LShift"
    } Else {
        return
    }
    global BracketEnableFlag := 0 ; Disables the [] actions (starting in lines 18 and 33 below) to prevent those characters from being typed unintentially.
    KeyWait "RShift", "L"
    global BracketEnableFlag := 1 ; Reenables those sections after the key release that would otherwise trigger them[]
    Send "{}}"
}

~RShift:: { ; Identical to the above hotkey on line 5. These should be consolidated to a function in future.
    KeyWait "LShift", "D"
    If GetKeyState("RShift", "P") {
        KeyWait "RShift"
    } Else {
        return
    }
    global BracketEnableFlag := 0
    KeyWait "LShift", "L"
    global BracketEnableFlag := 1
    Send "{{}"
}



LShift Up:: { ; Triggers when left shift is pressed.
    global BracketEnableFlag ; Includes the BracketEnableFlag variable into this namespace so it can be used in the next line
    if A_PriorKey = "LShift" and BracketEnableFlag { ; Sends a character if the prior key pressed was Shift (meaning it was just tapped alone and not used to capitalize a letter) and the bracket enable flag is enabled.
        Send "[" 
    }
}

RShift Up:: { ; Nearly identical to the previous hotkey in line 33. These should be consolidated to a function in a future update.
    global BracketEnableFlag
    if A_PriorKey = "RShift" and BracketEnableFlag {
        Send "]" 
    }
}