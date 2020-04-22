---
title: "PowerShell"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: true
---

# Install

{{< tabs >}}
{{< tab "MacOs">}}

```shell
brew tap homebrew/cask-versions
brew cask install powershell
```

{{< /tab>}}
{{< tab "Windows">}}

```shell

choco install powershell-core

```

{{< /tab>}}

{{< /tabs>}}

# Configure

## Profile

Install the required modules once: 

```powershell

Install-Module posh-git, oh-my-posh -Scope CurrentUser

```

Add the following to your $PROFILE

```powershell

#Give me $PsLastOutput for when I forget to assign it to something
$PSDefaultParameterValues[“Out-Default:OutVariable”] = “PsLastOutput”

#Make my shell look pretty
Import-Module posh-git 
Import-Module oh-my-posh
Set-Theme Agnoster

```

