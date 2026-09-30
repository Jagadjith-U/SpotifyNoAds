# SpotifyNoAds

A lightweight Windows automation tool that bypasses Spotify ad interruptions by restarting the Spotify desktop application and restoring playback.

## Why SpotifyNoAds?

SpotifyNoAds takes a simple approach: instead of trying to modify Spotify itself, it uses Windows automation to restart the application when an interruption occurs.

When Spotify restarts, it restores the previous playback session, allowing the interruption to be bypassed without modifying Spotify's files or application.

## Features

- Restart Spotify with a single keyboard shortcut
- Automatically reopen Spotify after restarting
- Restore playback after the restart
- Run automatically when Windows starts
- Lightweight and runs in the background

## Hotkey

| Action | Shortcut |
|---|---|
| Restart Spotify | `Ctrl + Alt + S` |

## Requirements

- Windows 10 or Windows 11
- Spotify Desktop
- AutoHotkey v2 (https://www.autohotkey.com)

## Installation

### 1. Install AutoHotkey

Download and install AutoHotkey v2 from the official website.

### 2. Download SpotifyNoAds

Clone this repository or download the project files.

### 3. Run the script

Double-click:

`SpotifyNoAds.ahk`

The script will run in the background and listen for the configured hotkey.

### 4. Use the shortcut

When a Spotify interruption occurs, press:

`Ctrl + Alt + S`

SpotifyNoAds will close Spotify, restart it, and restore playback automatically.

## Start Automatically With Windows

SpotifyNoAds can be configured to start automatically when you log in to Windows.

Create a shortcut to `SpotifyNoAds.ahk` and place it in the Windows Startup folder:

`Win + R` → `shell:startup`

This allows SpotifyNoAds to be ready whenever Windows starts.

## How It Works

SpotifyNoAds does not modify Spotify or inject code into the application.

Instead, it uses AutoHotkey to automate the normal Spotify desktop application:

1. Detect the hotkey.
2. Close Spotify.
3. Restart Spotify.
4. Allow Spotify to restore its previous playback state.
5. Continue playback.
6. Keep the Spotify window out of the way.

The project is intentionally simple: use Windows automation to take advantage of Spotify's own session restoration behavior.

## Project Structure

```text
SpotifyNoAds/
├── SpotifyNoAds.ahk
├── README.md
└── LICENSE
