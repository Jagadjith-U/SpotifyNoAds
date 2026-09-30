#Requires AutoHotkey v2.0
#SingleInstance Force

^!s::
{
    ; Close Spotify
    try ProcessClose("Spotify.exe")

    ; Wait for Spotify to fully close
    Sleep(700)

    ; Launch Spotify
    Run("spotify:")

    ; Wait for Spotify's main window to appear
    if WinWait("ahk_exe Spotify.exe",,8)
    {
        ; Give Spotify time to fully initialize
        ; and restore the playback session
        Sleep(1800)

        ; Minimize Spotify once initialization is complete
        try WinMinimize("ahk_exe Spotify.exe")

        ; Give Windows a moment to finish the minimize operation
        Sleep(200)

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

        ; Make sure Spotify remains minimized
        Sleep(300)
        try WinMinimize("ahk_exe Spotify.exe")
    }
}