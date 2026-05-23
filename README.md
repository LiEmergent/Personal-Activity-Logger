
# 🧠 Personal Activity Logger

> *"What gets measured, gets managed."*  
> An automated, privacy-first activity logger for Windows that helps you understand where your digital time actually goes.

## Why I built this

I realized something scary: I spend 8+ hours daily in front of my computer, but I couldn't tell you where the time went. Was I productive? Distracted? How many hours did I actually code vs scroll?

Manual logging failed — it became another distraction.

So I built this: **a silent background assistant that records my digital footprint without interrupting me.**

## Features

| Logger | What it captures | Privacy level |
|--------|------------------|---------------|
| **Activity Logger** | App name, window title, duration | ✅ No content, only metadata |
| **Keyboard Logger** | Character count per second (NOT the actual text) | ✅ Count only, no content |
| **Daily Summary** | Time distribution across apps and categories | ✅ Local analysis |

## What I learned about myself

After just one week of data, I discovered:

- 🔴 **40% of my "work time"** was actually context switching
- 🟡 **DeepSeek/ChatGPT** took 25% of my day (AI-assisted work)
- 🟢 My most productive hour: **9-10 AM**
- ⚠️ I unlock my screen **~15 times/day** — a sign of fragmented focus

## Tech Stack

| Component | Technology |
|-----------|------------|
| Logging | AutoHotkey v2 |
| Analysis | Python 3.11+ |
| Data Format | CSV (human-readable, future-proof) |
| Storage | Local files only (no cloud) |

## How It Works

Every 1 second:
    Check active window
    If changed → log: timestamp | duration | app | window title

Every keystroke:
    Increment counter
    Every second → log: timestamp | app | key count


## Installation

# Clone repository
git clone https://github.com/yourusername/personal-activity-logger.git

# Install AutoHotkey v2 (Windows only)
# Download from https://www.autohotkey.com

# Run loggers
double-click scripts/LogActivity.ahk
double-click scripts/LogKeyboard.ahk

# Generate daily report
python scripts/daily_summary.py

## Sample Output

2026-05-22 15:20:12|778 detik|chrome.exe|DeepSeek - AI discussion
2026-05-22 15:20:15|3 detik|chrome.exe|YouTube - Claude AI video

📊 DAILY SUMMARY - 2026-05-22
==================================================
DeepSeek/AI Research     : 2.3 hours (54%)
File Management          : 0.4 hours (10%)
Lock Screen/Idle         : 0.3 hours (7%)
Chat/Distraction         : 0.2 hours (5%)
Coding/Editing           : 0.2 hours (5%)
==================================================
Total logged: 4.2 hours

## Privacy Guarantee

- ✅ All data stays on your machine
- ✅ Keyboard logger records **COUNT only**, never content
- ✅ No internet upload unless you choose to
- ✅ `.gitignore` configured to exclude personal logs

## What's Next

- [ ] LLM integration (ask "what did I do yesterday?")
- [ ] Web dashboard with charts
- [ ] Focus mode detection
- [ ] Daily email report



## Connect

Built with curiosity by [Your Name]  
[LinkedIn] • [Twitter] • [Personal Website]

