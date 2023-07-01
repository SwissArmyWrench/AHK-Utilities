# AHK-Utilities

AutoHotKey is a very powerful tool that adds scripting and automation capabilities to Windows. However, this power can only be properly harnessed through writing, testing, and fixing code. Many users who are not programmers would still greatly benefit from the capabilties of AutoHotKey, so I host a collection of my personal utilities here to make them available to others.

AutoHotKey can be installed at <https://www.autohotkey.com/>. All code uploaded here is designed for AutoHotKey 2.0.

## A description of the utilies contained in this repo

### DiscordAltGrHandler

When using many keyboard layouts, the right Alt key becomes AltGr. This allows for the typing of many special characters. For example, on the US International layout, AltGr + 1 types the ¡ symbol used in the Spanish language. However, since this right Alt key no longer functions as Alt, this has the potential to break channel navigation shortcuts within the popular messenger service Discord. This script fixes this so the right Alt key functions as normal within Discord, without inhibiting the behaviors of the AltGr key, so you can type in whichever language you wish.

### ShiftBracketHandler

Some programming languages feature heavy use of curly brackets, also referred to as braces. These keys can be difficult to reach for some, and can often break the flow of typing by causing the user to either look down or make multiple attempts to find the right key. The shift keys are somewhat unused, so this script adds 2 behaviors: Tap either the left or right shift key once to type a left or right square bracket, and roll to either side to type a curly bracket. Rolling left, for example, starts with pressing the right shift key, pressing the left shift key, releasing right shift, and releasing left shift. This has a right-to-left motion to it that types a left curly bracket, and doing it in the opposite direction makes a right bracket. Updates slated for this script include improving configurability to make this easily adjustable without programming knowledge.

### RunKeyLauncher

When writing and testing AHK code in the VSCode programming environment, there currently is no way for VSCode to run your code in the way it runs other programs, since AHKV2 is not particularly well supported as a programming language in most tools. RunKeyLauncher.ahk is a fix for this. When in VSCode, it will detect the F5 keypress (which is the default to run and debug in VSCode) and read the window title to discover what file you are currently in, and run it. It can do this as long as the file is stored in a source file it knows about. The first time this script runs, it creates an RKL-SELFCONFIG file which can be edited in a text editor to add paths to source folders where your AHK scripts are stored. Any script stored in a folder mentioned in the self config path list can be discovered and launched by RKL. Updates set for the future are to separate the multiple source handler out into its own file/library and add GUI support to make it much more usable for non-programmers.