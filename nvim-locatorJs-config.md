# LocatorJS + Neovim Setup Guide (macOS)

> Click any UI element in the browser and jump straight to that file and line in your existing Neovim instance.

## Prerequisites

- macOS (Tahoe 26.2+)
- [Ghostty](https://ghostty.org) terminal
- Neovim installed via Homebrew (`/opt/homebrew/bin/nvim`)
- [LocatorJS](https://www.locatorjs.com) browser extension installed

---

## Step 1 — Create the Python handler script

This script receives the `nvim://` URL, parses it, and sends the file + line to your running Neovim instance.

```bash
mkdir -p ~/.local/bin
nano ~/.local/bin/nvim-handler.py
```

Paste this:

```python
#!/usr/bin/env python3
import sys
import subprocess
import os

url = sys.argv[1]

path = url.replace("nvim://file", "")
parts = path.split(":")
file_path = parts[0]
line = parts[1] if len(parts) > 1 else "1"

sock = "/tmp/nvim.sock"

if os.path.exists(sock):
    # Send file to existing nvim instance
    subprocess.run([
        "/opt/homebrew/bin/nvim",
        "--server", sock,
        "--remote", file_path
    ])
    # Jump to correct line
    subprocess.run([
        "/opt/homebrew/bin/nvim",
        "--server", sock,
        "--remote-send", f":{line}<CR>"
    ])
    # Focus Ghostty
    subprocess.Popen(["osascript", "-e", 'tell application "Ghostty" to activate'])
else:
    # No running nvim, open a new Ghostty window
    subprocess.Popen([
        "open", "-na", "Ghostty.app",
        "--args",
        "-e", "/opt/homebrew/bin/nvim",
        f"+{line}",
        file_path
    ])
```

Save with **Ctrl+O**, **Enter**, **Ctrl+X**, then make it executable:

```bash
chmod +x ~/.local/bin/nvim-handler.py
```

---

## Step 2 — Add nvim socket alias to `.zshrc`

This makes nvim always listen on a socket so the handler can find it.

```bash
echo 'alias nvim="/opt/homebrew/bin/nvim --listen /tmp/nvim.sock"' >> ~/.zshrc
source ~/.zshrc
```

---

## Step 3 — Build the macOS URL handler app

This app intercepts `nvim://` URLs from the browser and calls the Python script.

### 3a. Create the app in Script Editor

1. Open **Script Editor** (Cmd+Space → "Script Editor" → Enter)
2. Click **File → New**
3. Paste this:

```applescript
on open location this_URL
    do shell script "/usr/bin/python3 /Users/YOUR_USERNAME/.local/bin/nvim-handler.py " & quoted form of this_URL
end open location
```

> ⚠️ Replace `YOUR_USERNAME` with your actual macOS username (run `whoami` in terminal to check)

4. Click **File → Export**
   - File Format: **Application**
   - Name: `NvimURLHandler`
   - Location: `/Applications`
   - Click **Save**

### 3b. Register the `nvim://` URL scheme

Run these one by one in Ghostty:

```bash
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes array" /Applications/NvimURLHandler.app/Contents/Info.plist

/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0 dict" /Applications/NvimURLHandler.app/Contents/Info.plist

/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLSchemes array" /Applications/NvimURLHandler.app/Contents/Info.plist

/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLSchemes:0 string nvim" /Applications/NvimURLHandler.app/Contents/Info.plist
```

Verify it worked:

```bash
/usr/libexec/PlistBuddy -c "Print :CFBundleURLTypes" /Applications/NvimURLHandler.app/Contents/Info.plist
```

You should see:
```
Array {
    Dict {
        CFBundleURLSchemes = Array {
            nvim
        }
    }
}
```

### 3c. Register with macOS and open once

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f /Applications/NvimURLHandler.app

open /Applications/NvimURLHandler.app
```

---

## Step 4 — Grant permissions

When NvimURLHandler runs for the first time, macOS will ask for permissions.

1. Go to **System Settings → Privacy & Security → Accessibility**
2. Make sure **NvimURLHandler** is in the list and toggled **ON**
3. Go to **Privacy & Security → Automation**
4. Make sure **Ghostty → System Events** is toggled **ON**

---

## Step 5 — Configure LocatorJS

1. Click the LocatorJS gear icon in your browser
2. Select **Custom link**
3. Paste this:

```
nvim://file/${projectPath}${filePath}:${line}:${column}
```

4. Save

---

## Step 6 — Test it

```bash
open "nvim://file/Users/YOUR_USERNAME/.zshrc:10:1"
```

Ghostty should focus and your `.zshrc` should open at line 10.

---

## Daily Workflow

1. Open Ghostty and type `nvim` to start editing
2. Browse your app in the browser
3. Hold **Option** and click any UI element
4. Neovim jumps to that exact file and line ✅

> **Note:** Always have nvim open before clicking in the browser. If nvim isn't running, it will open a new Ghostty window as a fallback.

---

## Re-setup After Exporting a New Version of the App

If you ever re-export `NvimURLHandler.app` from Script Editor, you must re-run the plist registration commands from **Step 3b** and **Step 3c** — exporting overwrites the plist.

---

## Files Created

| File | Purpose |
|------|---------|
| `~/.local/bin/nvim-handler.py` | Parses URL and opens file in nvim |
| `/Applications/NvimURLHandler.app` | Intercepts `nvim://` URLs from browser |
| `~/.zshrc` alias | Makes nvim listen on `/tmp/nvim.sock` |
