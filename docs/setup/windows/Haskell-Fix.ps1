# Fix-GHCup.ps1
# Repairs a broken GHC/GHCup install on Windows and ensures cabal is installed + on PATH.

Write-Host "=== GHCup repair starting ==="

function Ensure-InPathUser($pathToAdd) {
  $userPath = [Environment]::GetEnvironmentVariable('Path','User')
  if (-not $userPath) { $userPath = "" }
  if ($userPath -notlike "*$pathToAdd*") {
    $newUserPath = ($userPath.TrimEnd(';') + ';' + $pathToAdd).Replace(';;',';')
    [Environment]::SetEnvironmentVariable('Path', $newUserPath, 'User')
    Write-Host "Added to User PATH: $pathToAdd"
  } else {
    Write-Host "Already on User PATH: $pathToAdd"
  }
}

# 0) Preflight
$ghcupBin = "C:\ghcup\bin"
$cabalBin = Join-Path $env:APPDATA 'cabal\bin'

if (-not (Test-Path $ghcupBin)) {
  Write-Host "GHCup not found in C:\ghcup. Bootstrapping..."
  Set-ExecutionPolicy Bypass -Scope Process -Force
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  iwr https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing | iex
}

# Ensure current session PATH has ghcup & cabal paths
if ($env:Path -notlike "*$ghcupBin*") { $env:Path += ";$ghcupBin" }
if ($env:Path -notlike "*$cabalBin*") { $env:Path += ";$cabalBin" }

# 1) Ensure MSYS2 (runtime DLLs)
Write-Host "`n== Installing MSYS2 (for runtime DLLs) =="
try { ghcup install msys2 -f } catch { Write-Warning $_ }

# 2) Reinstall a healthy GHC and set it as default
Write-Host "`n== Repairing GHC =="
# Remove specific broken version if present
$broken = "9.6.7"
if (Test-Path "C:\ghcup\ghc\$broken") {
  try { ghcup rm -t ghc $broken -f } catch { Write-Warning $_ }
}
# Install recommended (or latest stable) and set
ghcup install ghc recommended -f
ghcup set ghc recommended

# 3) Ensure cabal is installed and set
Write-Host "`n== Installing cabal =="
try { ghcup install cabal recommended -f } catch { Write-Warning $_ }
try { ghcup set cabal recommended } catch { Write-Warning $_ }

# 4) Persist PATH for future sessions
Ensure-InPathUser $ghcupBin
Ensure-InPathUser $cabalBin

Write-Host "`n== Versions =="
try { ghcup --version } catch {}
try { ghc --version } catch {}
try { ghci --version } catch {}
try { cabal --version } catch {}

Write-Host "`n=== Done. Open a NEW PowerShell window before using cabal/ghc. ==="
