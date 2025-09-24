<img  width="128" height="128"  alt="image" src="https://github.com/Xll-ai/Xll.Ai.MathMeld/blob/main/docs/images/Google-Gemini-2-5.png" />


### `GeminiCLI_Setup.md`

# GeminiCLI Setup Guide

This guide covers how to download and install `gemincli`, the command-line interface for Google's Gemini models.

---

## 1. Prerequisites

Before you start, make sure you have the following installed on your system:

* **Git**: [git-scm.com/downloads](https://git-scm.com/downloads)
* **Go**: Version 1.20 or later. (See the Go installation guide if needed).

---

## 2. Download and Install

The process involves cloning the source code from GitHub and then using the `go install` command.

1.  **Clone the Repository**: Open your terminal and run the following command to download the source code:

    ``` bash
    git clone [https://github.com/google/generative-ai-go](https://github.com/google/generative-ai-go)
    ```

    This will create a new directory named `generative-ai-go`.

2.  **Navigate to the Directory**: Change your current directory to the `gemincli` folder within the cloned repository:

    ``` bash
    cd generative-ai-go/cmd/gemincli
    ```

3.  **Install the Tool**: Run the `go install` command. This will compile the source code and place the `gemincli` executable in your Go bin directory, making it accessible from anywhere in your terminal.

    ``` bash
    go install .
    ```

---

## 3. Verify the Installation ✅

To confirm that GeminiCLI is installed and ready to use, run the help command:

```bash
gemincli -h
```


# 4. File Path Locations Guide

This document outlines the default installation path for the `gemincli` executable and explains the `AppData` directories on Windows.

---

## `gemincli` Executable Path 📍

After you run `go install .`, the `gemincli` binary is placed in the Go bin directory. This location is consistent across operating systems, with the only difference being the user's home directory path.

* **Windows**:
    ```
    %USERPROFILE%\go\bin\gemincli.exe
    ```
    *(Example: `C:\Users\YourUsername\go\bin\gemincli.exe`)*

* **macOS & Linux**:
    ```
    $HOME/go/bin/gemincli
    ```
    *(Example: `/Users/yourusername/go/bin/gemincli` or `/home/yourusername/go/bin/gemincli`)*

**Note**: For the `gemincli` command to be accessible from any directory, its location (`go/bin`) must be in your system's `PATH` environment variable.

---

## Windows `AppData` Folder Paths 📂

The `AppData` folder contains user-specific application data and is located within your user profile (e.g., `C:\Users\YourUsername`). It is typically a hidden folder.

You can quickly navigate to these locations by pasting the variable (e.g., `%APPDATA%`) into the address bar of the Windows File Explorer.

### Roaming

* **Variable**: `%APPDATA%`
* **Path**: `C:\Users\<YourUsername>\AppData\Roaming`
* **Purpose**: Stores data that can "roam" with a user's profile across different computers in a domain network. This is for important settings, licenses, or browser profiles.

### Local

* **Variable**: `%LOCALAPPDATA%`
* **Path**: `C:\Users\<YourUsername>\AppData\Local`
* **Purpose**: Stores data specific to a single machine that should not be synced. This is ideal for large files, application caches, and other non-essential data.

### LocalLow

* **Variable**: `%USERPROFILE%\AppData\LocalLow`
* **Path**: `C:\Users\<YourUsername>\AppData\LocalLow`
* **Purpose**: Used by "low-integrity" or sandboxed applications that run with restricted security permissions, such as browser plug-ins in protected mode.
