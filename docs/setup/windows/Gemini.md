<img  width="128" height="128"  alt="image" src="https://github.com/Xll-ai/Xll.Ai.MathMeld/blob/main/docs/images/Google-Gemini-2-5.png" />


### `GeminiCLI_Setup.md`

```markdown
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


