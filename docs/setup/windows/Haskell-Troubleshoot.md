# Haskell Troubleshooting on Windows (GHC / GHCup)

If `ghc` isn’t recognized in PowerShell, use this checklist to fix it fast.

---

## 1) Check if GHCup is installed
```powershell
Test-Path 'C:\ghcup\bin\ghcup.exe'
```
- **False** → go to **Step 2** (install GHCup).
- **True** → go to **Step 3** (install/select GHC + fix PATH).

---

## 2) Install GHCup (installs GHC, cabal, etc.)
Run in **PowerShell (non-admin)**:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iwr https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing | iex
```
Accept the defaults (GHC + cabal; HLS optional). When finished, **close and reopen** PowerShell.

---

## 3) If GHCup exists but `ghc` is missing
Install and select the recommended GHC:
```powershell
& "C:\ghcup\bin\ghcup.exe" install ghc recommended
& "C:\ghcup\bin\ghcup.exe" set ghc recommended
```

---

## 4) Ensure PATH is set
Add for the **current session**:
```powershell
$ghcupBin = 'C:\ghcup\bin'
$cabalBin = Join-Path $env:APPDATA 'cabal\bin'
$env:Path += ";$ghcupBin;$cabalBin"
```

Add **permanently** to your **user** PATH:
```powershell
$userPath = [Environment]::GetEnvironmentVariable('Path','User')
$newUserPath = ($userPath + ';C:\ghcup\bin;' + (Join-Path $env:APPDATA 'cabal\bin')) -replace ';;',';'
[Environment]::SetEnvironmentVariable('Path', $newUserPath, 'User')
```
> Afterwards, **open a new PowerShell window** so the updated PATH is loaded.

---

## 5) Verify
```powershell
ghcup --version
ghc --version
ghci --version
cabal --version
where ghc
where cabal
```
You should see version info and the paths (e.g., `C:\ghcup\...`).

---

## 6) Quick “hello world” test
```powershell
'main = putStrLn "Hello, world!"' | Out-File -Encoding utf8 .\hello.hs
ghc -o hello hello.hs
.\hello.exe
```
You should see: `Hello, world!`

---

## Common Pitfalls & Fixes

- **Didn’t reopen the shell:** PATH changes won’t apply until you open a **new** PowerShell window.
- **Antivirus / SmartScreen blocked the script:** Temporarily allow the bootstrap URL or run the commands line-by-line.
- **Corporate proxy:** Set a proxy before bootstrapping:
  ```powershell
  netsh winhttp set proxy <host:port>
  ```
- **32-bit Windows:** Modern GHC releases require **64-bit** Windows 10/11.
- **Multiple conflicting installs:** Remove old Haskell Platform or Chocolatey installs from PATH; keep `C:\ghcup\bin` first.
- **Non-default shells (Git Bash, MSYS2):** Verify PATH there as well, or use PowerShell while installing.

---

## Useful Diagnostics (paste these when asking for help)
```powershell
Get-ChildItem C:\ghcup\bin
[Environment]::GetEnvironmentVariable('Path','User')
$env:Path
ghcup whereis ghc
where ghc
```
(If `ghcup whereis ghc` isn’t available, skip it.)

---

## Optional: Editor integration (VS Code)
```powershell
ghcup install hls     # Haskell Language Server
```
Then install the **Haskell** extension in VS Code and open your project folder.

---

## Reset / Uninstall
```powershell
ghcup nuke            # remove GHCup-managed tools
# or manually delete C:\ghcup\ and remove its PATH entries
```
