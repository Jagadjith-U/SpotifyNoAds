#Requires AutoHotkey v2.0
#SingleInstance Force

^!s::
{
    ; ==========================================
    ; CLOSE SPOTIFY
    ; ==========================================

    try ProcessClose("Spotify.exe")

    ; Wait until Spotify is completely gone
    Loop
    {
        if !ProcessExist("Spotify.exe")
            break

        Sleep(50)
    }


    ; ==========================================
    ; REOPEN SPOTIFY
    ; ==========================================

    Run("spotify:")


    ; ==========================================
    ; WAIT FOR SPOTIFY WINDOW
    ; ==========================================

    if !WinWait("ahk_exe Spotify.exe",,8)
        return

    spotify := WinExist("ahk_exe Spotify.exe")

    if !spotify
        return


    ; ==========================================
    ; MINIMIZE IMMEDIATELY
    ; ==========================================

    MinimizeSpotify(spotify)


    ; ==========================================
    ; KEEP SPOTIFY MINIMIZED DURING STARTUP
    ; ==========================================

    ; Spotify can restore/maximize its window shortly
    ; after launch. Watch it for a short period and
    ; immediately minimize it again if that happens.

    endTime := A_TickCount + 5000

    while A_TickCount < endTime
    {
        if !WinExist("ahk_id " spotify)
            break

        if WinGetMinMax("ahk_id " spotify) != -1
            MinimizeSpotify(spotify)

        Sleep(50)
    }


    ; ==========================================
    ; PLAY SPOTIFY DIRECTLY
    ; ==========================================

    ; WM_APPCOMMAND = 0x0319
    ; APPCOMMAND_MEDIA_PLAY = 46
    ; 46 << 16 = 0x2E0000
    ;
    ; This is a DIRECT PLAY command to Spotify.
    ; It does NOT go to YouTube or another
    ; background media player.

    try PostMessage(
        0x0319,
        0,
        0x2E0000,
        ,
        "ahk_id " spotify
    )


    ; ==========================================
    ; FINAL MINIMIZE
    ; ==========================================

    MinimizeSpotify(spotify)
}


; ==============================================
; SPOTIFY MINIMIZE FUNCTION
; ==============================================

MinimizeSpotify(hwnd)
{
    ; WM_SYSCOMMAND = 0x0112
    ; SC_MINIMIZE   = 0xF020

    try PostMessage(
        0x0112,
        0xF020,
        0,
        ,
        "ahk_id " hwnd
    )
}
