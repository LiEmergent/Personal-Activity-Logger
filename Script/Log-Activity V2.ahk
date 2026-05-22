#Requires AutoHotkey v2.0

; ============================================
; LOG AKTIVITAS DENGAN DURASI (AutoHotkey v2)
; Hanya merekam saat pindah aplikasi/window
; ============================================

logFile := A_MyDocuments "\activity-log-duration.csv"

; Inisialisasi variabel untuk session sebelumnya
lastProcess := ""
lastTitle := ""
lastTime := 0

; Timer pengecekan setiap 1 detik
SetTimer(CheckActivity, 1000)

; Script akan tetap jalan karena ada timer (tidak perlu #Persistent)

CheckActivity()
{
    global logFile, lastProcess, lastTitle, lastTime
    
    ; Ambil informasi window aktif sekarang
    try {
        currentProcess := WinGetProcessName("A")
        currentTitle := WinGetTitle("A")
    } catch {
        ; Jika gagal (misal tidak ada window aktif), abaikan
        return
    }
    
    ; Jika terjadi perubahan (ganti aplikasi atau ganti judul window)
    if (currentProcess != lastProcess or currentTitle != lastTitle) {
        now := A_TickCount
        
        ; Rekam sesi sebelumnya (jika ada)
        if (lastTime != 0) {
            duration := Round((now - lastTime) / 1000)  ; durasi dalam detik
            
            ; Hanya rekam jika durasi > 0 detik
            if (duration > 0) {
                timestamp := FormatTime(A_Now, "yyyy-MM-dd HH:mm:ss")
                line := timestamp "|" duration " detik|" lastProcess "|" lastTitle "`n"
                FileAppend(line, logFile)
            }
        }
        
        ; Mulai sesi baru
        lastProcess := currentProcess
        lastTitle := currentTitle
        lastTime := now
    }
}