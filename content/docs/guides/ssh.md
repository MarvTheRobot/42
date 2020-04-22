---
title: "SSH"
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
brew install ssh
```

{{< /tab>}}
{{< tab "Windows">}}

```shell
choco install ssh

```

{{< /tab>}}

{{< /tabs>}}

# Configure

- `ssh-keygen -t rsa`  
- Follow instructions


## Multiple Personas

{{< hint warning >}}
When providing a host alias, try to retain the original url and provide only suffix.  
This can help things like Azure DevOps VsCode extensions to continue to function.
{{< /hint>}}

### ~/.ssh/config

```shell

Host ssh.dev.azure.com.WORK
    HostName ssh.dev.azure.com
    IdentityFile ~/.ssh/id_rsa_WORK
    IdentitiesOnly yes

```

Add host alias entries as required

### When cloning

Use the `Host` entry instead of the `HostName`, 
the specified key will then be used.

### Why

Imagine two instances on Azure DevOps

`git@ssh.dev.azure.com:v3/PERSONAL/<project>/<repo>`
`git@ssh.dev.azure.com:v3/WORK/<project>/<repo>`

You want to be able to use different SSH keys per instance. 
Aliasing at least one of them will allow you to choose a specific key

`git@ssh.dev.azure.com.WORK:v3/WORK/<project>/<repo>`

# Backup

{{< hint info >}}
**TODO**
Document backup commands for storing keys in KeyVault (or link to KeyVault page)
{{< /hint >}}

# Restoring

I backup my keys to an Azure KeyVault. To pull down what I need for a restore quickly and easily, I am going to need either the Az CLI or PowerShell.


{{< tabs "restoring-keys" >}}
{{< tab "Azure PowerShell" >}}

### Get the key

```powershell

$vaultName = 'vault'
$keyName   = 'ssh-key-private'
$keyPath   = '~/.ssh/id_rsa'

install-module az.Accounts -Scope CurrentUser
install-module az.KeyVault -Scope CurrentUser

Login-AzAccount

(Get-AzKeyVaultSecret -VaultName $vaultName -Name $keyName).SecretValueText | Out-File $keyPath

```

### Set the permissions

```shell
chmod 0600 ~/.ssh/id_rsa 
```

### Generate a public key

```shell
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
```
 
{{< /tab >}}
{{< tab "Azure Cli" >}}

# Azure Cli
**TODO**
Document backup commands for storing keys in KeyVault (or link to KeyVault page)
 
{{< /tab >}}
{{< /tabs >}}







