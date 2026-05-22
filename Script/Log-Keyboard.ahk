#Requires AutoHotkey v2.0

; ============================================
; LOG KEYBOARD - FIXED VERSION
; Menghitung semua karakter dengan akurat
; ============================================

logFile := A_MyDocuments "\keyboard-log.csv"
keyCount := 0

; Timer setiap 1 detik untuk menyimpan
SetTimer(SaveKeyboardMetric, 1000)

; ========== HOTKEY UNTUK HURUF ==========
Hotkey("~*a", IncrementKeyCount)
Hotkey("~*b", IncrementKeyCount)
Hotkey("~*c", IncrementKeyCount)
Hotkey("~*d", IncrementKeyCount)
Hotkey("~*e", IncrementKeyCount)
Hotkey("~*f", IncrementKeyCount)
Hotkey("~*g", IncrementKeyCount)
Hotkey("~*h", IncrementKeyCount)
Hotkey("~*i", IncrementKeyCount)
Hotkey("~*j", IncrementKeyCount)
Hotkey("~*k", IncrementKeyCount)
Hotkey("~*l", IncrementKeyCount)
Hotkey("~*m", IncrementKeyCount)
Hotkey("~*n", IncrementKeyCount)
Hotkey("~*o", IncrementKeyCount)
Hotkey("~*p", IncrementKeyCount)
Hotkey("~*q", IncrementKeyCount)
Hotkey("~*r", IncrementKeyCount)
Hotkey("~*s", IncrementKeyCount)
Hotkey("~*t", IncrementKeyCount)
Hotkey("~*u", IncrementKeyCount)
Hotkey("~*v", IncrementKeyCount)
Hotkey("~*w", IncrementKeyCount)
Hotkey("~*x", IncrementKeyCount)
Hotkey("~*y", IncrementKeyCount)
Hotkey("~*z", IncrementKeyCount)

; ========== HOTKEY UNTUK ANGKA ==========
Hotkey("~*0", IncrementKeyCount)
Hotkey("~*1", IncrementKeyCount)
Hotkey("~*2", IncrementKeyCount)
Hotkey("~*3", IncrementKeyCount)
Hotkey("~*4", IncrementKeyCount)
Hotkey("~*5", IncrementKeyCount)
Hotkey("~*6", IncrementKeyCount)
Hotkey("~*7", IncrementKeyCount)
Hotkey("~*8", IncrementKeyCount)
Hotkey("~*9", IncrementKeyCount)

; ========== HOTKEY UNTUK TOMBOL KHUSUS ==========
Hotkey("~*Space", IncrementKeyCount)
Hotkey("~*Enter", IncrementKeyCount)
Hotkey("~*Backspace", IncrementKeyCount)
Hotkey("~*.", IncrementKeyCount)
Hotkey("~*,", IncrementKeyCount)
Hotkey("~*;", IncrementKeyCount)
Hotkey("~*'", IncrementKeyCount)
Hotkey("~*[", IncrementKeyCount)
Hotkey("~*]", IncrementKeyCount)
Hotkey("~*-", IncrementKeyCount)
Hotkey("~*=", IncrementKeyCount)
Hotkey("~*Tab", IncrementKeyCount)

; Tombol backtick (karakter `) - perlu ditulis khusus
Hotkey("~*``", IncrementKeyCount)

IncrementKeyCount(ThisHotkey)
{
    global keyCount
    keyCount++
}

SaveKeyboardMetric()
{
    global logFile, keyCount
    
    ; Dapatkan timestamp saat ini
    now := A_Now
    timestamp := FormatTime(now, "yyyy-MM-dd HH:mm:ss")
    
    ; Jika tidak ada ketikan, skip
    if (keyCount == 0) {
        return
    }
    
    ; Dapatkan aplikasi aktif
    try {
        currentApp := WinGetProcessName("A")
    } catch {
        currentApp := "Unknown"
    }
    
    ; Tulis ke file
    line := timestamp "|" currentApp "|" keyCount " karakter`n"
    FileAppend(line, logFile)
    
    ; Debug: munculin tooltip (bisa dihapus nanti)
    ToolTip("Keyboard: " keyCount " karakter")
    SetTimer(() => ToolTip(), -2000)
    
    ; Reset counter
    keyCount := 0
}