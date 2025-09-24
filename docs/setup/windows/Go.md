
<img  width="128" height="128"  alt="image" src="https://github.com/Xll-ai/Xll.Ai.MathMeld/blob/main/docs/images/Icon_ProgLanguage__256x256_Go.png" />

# Go Installation Guide

This guide provides the steps to install the Go programming language on your system. 🚀


---

## 1. Download Go

First, download the official installer for your operating system from the Go website.

➡️ **Official Go Downloads Page**: [go.dev/dl/](https://go.dev/dl/)

Select the package for your operating system (Windows, macOS, or Linux).

In our case Windows on left

<img width="1242" height="261" alt="image" src="https://github.com/user-attachments/assets/75026e61-c09e-40e4-a23c-6ec33729ef6e" />

<img width="1237" height="407" alt="image" src="https://github.com/user-attachments/assets/644bf037-81a6-40b9-9755-ae9f48a8c1a0" />



---

## 2. Installation Steps

### Windows 💻

1.  **Run the Installer**: Open the downloaded `.msi` file.
2.  **Follow the Wizard**: Accept the license agreement and follow the prompts. The installer automatically adds the Go binary to your system's **PATH**. By default, Go is installed in `C:\Program Files\Go`.
3.  **Restart Your Terminal**: Open a new Command Prompt or PowerShell window for the **PATH** changes to take effect.

### macOS 🍎

You can use the official package installer or the Homebrew package manager.

**Using the Package Installer:**
1.  **Run the Installer**: Open the `.pkg` file you downloaded.
2.  **Follow the Prompts**: The wizard will guide you through the installation.

**Using Homebrew (Recommended):**
```bash
brew install go
```

## 3. Windows - What the Install Looks like

On Windows, Go installs under **Program Files** by default and uses your home directory as the workspace. Add both Go’s `bin` folders to **PATH** so the `go` tool and your installed binaries are available in any terminal.

- **GOROOT (default):** `C:\Program Files\Go`
- **GOPATH (default):** `%USERPROFILE%\go`
- **GOBIN (default):** _unset_ → `%GOPATH%\bin`
- **GOCACHE (default):** `%LocalAppData%\go-build`
- **Module cache:** `%GOPATH%\pkg\mod`
- **Go env config file:** `%AppData%\go\env`
- **PATH suggestion (System/User Environment Variables):**

### Powershell Example

<img width="813" height="287" alt="image" src="https://github.com/user-attachments/assets/f25e25cd-803b-47ca-b9b9-0d1ce0bcf78a" />


