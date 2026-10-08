#Requires AutoHotkey v2.0
#SingleInstance Force

^!s::
{
    ; 1. CLOSE SPOTIFY
    try ProcessClose("Spotify.exe")

    ; Wait only until the process is actually gone
    while ProcessExist("Spotify.exe")
        Sleep(20)


    ; 2. REOPEN SPOTIFY
    Run("spotify:")


    ; 3. WAIT FOR SPOTIFY WINDOW
    if !WinWait("ahk_exe Spotify.exe",,10)
        return

    spotify := WinExist("ahk_exe Spotify.exe")

    if !spotify
        return


    ; 4. ACTIVATE SPOTIFY
    WinActivate("ahk_id " spotify)

    if !WinWaitActive("ahk_id " spotify,,3)
        return

    ; Small initialization buffer
    Sleep(500)


    ; 5. NEXT SONG
    PostMessage(
        0x319,
        0,
        11 << 16,
        ,
        "ahk_id " spotify
    )


    ; 6. LET NEXT TRACK START
    Sleep(500)


    ; 7. DIRECT PLAY
    PostMessage(
        0x319,
        0,
        46 << 16,
        ,
        "ahk_id " spotify
    )


    ; 8. GIVE PLAY COMMAND TIME TO TAKE EFFECT
    Sleep(500)


    ; 9. MINIMIZE — FINAL ACTION
    WinMinimize("ahk_id " spotify)
}
