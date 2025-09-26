# Install GHC (Glasgow Haskell Compiler) on Windows

## ✅ Recommended: Install via **GHCup**
GHCup is the official, cross-platform installer for Haskell tools (GHC, Cabal, HLS, Stack).

1) Open **PowerShell (non-admin)**.  
2) Run the bootstrap script:

**Single line:**
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iwr https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing | iex
```

**Or multiline:**
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iwr https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing | iex
```

When prompted, accept the defaults to install:
- **GHC** (the compiler)
- **cabal-install** (build tool)
- **Haskell Language Server (HLS)** (optional but recommended for editors)
- **Stack** (optional)

> GHCup installs to `C:\ghcup\` and sets up the required environment automatically.

---

## 🔎 Verify your setup
Close and re-open PowerShell so your PATH updates, then check:

```powershell
ghc --version
ghci --version
cabal --version
```

Quick “hello world” test:

```powershell
'main = putStrLn "Hello, world!"' | Out-File -Encoding utf8 .\hello.hs
ghc -o hello hello.hs
.\hello.exe
```

Interactive REPL:

```powershell
ghci
```

---

## 🧰 Useful next commands

Switch versions / manage tools with a friendly TUI:
```powershell
ghcup tui
```

Install a specific GHC or HLS version:
```powershell
ghcup install ghc latest
ghcup set ghc <version>
ghcup install hls
```

Cabal first-time setup:
```powershell
cabal update
cabal init   # create a new project (follow prompts)
```

---

## 🧑‍💻 Editor integration (VS Code example)
1) Install **Haskell** extension from the VS Code marketplace.  
2) Ensure HLS is installed (via GHCup):  
   ```powershell
   ghcup install hls
   ```
3) Open your project folder in VS Code; HLS should start automatically.

---

## 🪙 PATH notes (if commands aren’t found)
Make sure these are on your **Path** (reopen your terminal after changes):
- `C:\ghcup\bin`
- `C:\Users\<YourName>\AppData\Roaming\cabal\bin`

---

## 🧯 Troubleshooting

- **`ghc`/`cabal` not recognized:** Reopen PowerShell; if still broken, add the PATH entries above manually via *System Properties → Environment Variables*.
- **Corporate proxy:** Set PowerShell proxy before running bootstrap:
  ```powershell
  netsh winhttp set proxy <host:port>
  ```
- **Antivirus blocks script:** Temporarily allow the bootstrap URL or run the multiline command so each step is visible.
- **32-bit Windows:** Modern GHC releases require 64-bit Windows 10/11.

---

## 🧹 Uninstall (if needed)
```powershell
ghcup nuke    # removes GHCup-managed tools
# or manually delete C:\ghcup\ and remove its PATH entries
```

That’s it—you’re ready to write Haskell on Windows!
