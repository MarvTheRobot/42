---
title: "Git"
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
brew install git
```

{{< /tab>}}
{{< tab "Windows">}}

```shell
choco install git
```

{{< /tab>}}

{{< /tabs>}}

# Configure

At minimum, 
you should set the user name and email address to be associated with your commits.

```shell

git config user.name "Full Name"
git config user.email "contact@domain.tld"
`
```

## Multiple Personas

To support multiple personas, 
create incremental configuration files 
and import the right one depending on where the repository is in your filesystem.

*contents of ~/Code/<persona>/gitconfig.inc*
```
[user]
	name = full name
	email = someone@somewhere.tld
```

Add	any git configuration specific to a persona, such as name, email, GPG key, etc. 

Within `~/.gitconfig`, create required conditional include statements for each persona.

```shell

#...some other stuff here too

[includeIf "gitdir:~/Code/<persona>/"]
	path=~/Code/<persona>/gitconfig.inc
	
```

The effect is easily tested, in a repository under each persona, execute `git config --get user.email` (or another property if changed) ensuring you see the correct result.

## Apply

If you don't care when the only difference is whitespace

`git config --global apply.ignoreWhitespace change`

## Pull

Only pull if fast-forward is possible; don't trash anything locally, let me figure it out myself.

`git config --global pull.ff only`

## Push 

Use the current local branch name when pushing if no remote branch exists. 

`git config push.default current`


---

# Useful Commands

## Git Log

See what's been going on

`git log`

Make it easier to see what's going on

`git log --graph --oneline --decorate`

# Other stuff

## Forcing updates

At least try to be safe: 

`git push --force-with-lease`

A little easier: 

`git config --global alias.push-with-lease 'push --force-with-lease' `

and use `git push-with-lease` when forcing updates.

## Rebasing

Is effectively "re-writing your git history" and is mostly *fine*. 

Typically you'll only want to rebase *your* work **before** you push to a remote repository; doing so allows you to 'clean-up' the commit messages and ensure they are a) useful and b) in-line with any agreed standards your team/project has.

If you do need to rebase a remote branch you'll need to perform a forced push due to the nature of what you're about to do. 

> If you rebase a remote branch that others are either working on or have created child branches from, you're about to cause them a lot of headaches. 

`git push --force-with-lease` will at least only rebase the remote if YOUR branch contains ALL of the commits on the remote. This prevents you overwriting a remote branch that contains work you're not aware of.

A 'very' small gain here is to have a git alias for the command.

```shell
git config --global alias.push-with-lease 'push --force-with-lease' 
```

`git push-with-lease` will now do the same thing with a few less keystrokes.