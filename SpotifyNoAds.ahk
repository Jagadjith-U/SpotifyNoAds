#Requires AutoHotkey v2.0
#SingleInstance Force

^!s::
{
    ; Close Spotify
    try ProcessClose("Spotify.exe")

    ; Wait for Spotify to fully close
    Sleep(500)

    ; Launch Spotify
    Run("spotify:")

    ; Wait for Spotify's main window to appear
    if WinWait("ahk_exe Spotify.exe",,8)
    {
        ; Give Spotify enough time to initialize completely
        ; and restore the playback session
        Sleep(2000)

        ; Minimize Spotify once initialization is complete
        try WinMinimize("ahk_exe Spotify.exe")

        ; Give the minimize operation a moment to register
        Sleep(100)

        ; Tell Spotify specifically to PLAY
        ; WM_APPCOMMAND = 0x319
        ; APPCOMMAND_MEDIA_PLAY_PAUSE = 0xE0000
        try PostMessage(
            0x319,
            0,
            0xE0000,
            ,
            "ahk_exe Spotify.exe"
        )

        ; Final safeguard
        try WinMinimize("ahk_exe Spotify.exe")
    }
}
