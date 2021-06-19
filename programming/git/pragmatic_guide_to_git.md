# Pragmatic guide to git

Pragmatic Guide to Git [ Pragmatic Programmers ](https://www.pragprog.com/titles/pg_git/pragmatic-guide-to-git/)

## Basic Operations

### User setup

Globally

```bash
git config --global user.name "Your Name"
git config --global user.email "user@domain.com"
```

Per repository

```bash
cd /path/to/repository
git config user.name "Your name"
git config user.email "user@domain.com"
```

Turn on colors

```
git config --global color.ui auto
```

Configure git's editor

```bash
git config --global core.editor /path/to/editor
```

### Cloning

Clone a repository

```bash
# git clone some-repository
git clone git://github.com/tswicegood/bobby-tables.git
```

Clone to a specific path

```bash
# git clone some-repository some-path
git clone git://github.com/tswicegood/bobby-tables.git
```

Create shallow clone with the last 50 commits

```bash
git clone --depth 50 some-repository
```

### Staging files

Stage a file to commit

```bash
git add /path/to/file
git add /path/
# stage everything under the current directory
git add .
```

Add all file in the current repository

```bash
git add -A | --all
```

Add all tracked files that have been changed

```bash
git add -u | --update
```

Choose which changes to commit

```bash
git add -p|--patch
git add -p path/to/file
```

Open the current diff in the editor

```bash
git add -e
git add -e path/to/file
```

### Commits

Stage and commit changes

```bash
git add <some file>
git commit -m "Some message"
```

Commit all modified files

```bash
git commit -m "Some message" -a
```

Commit and launch editor for commit message

```bash
git add <some file>
git commit
```

### Ignore files

Ignore a file or directory called cache

```bash
#  add the following to .gitignore
cache
```

Ignore all .swp files from vim

```bash
*.swp
```

Set up global excludes file

```
bash git config --global core.excludesfile ~/.gitignore
```

### Undoing uncommitted changes

Unstage changes to an existing file

```bash
git reset HEAD
```

Unstage new-file

```bash
git rm --cached
```

Unstage cache.py

```bash
git reset HEAD -- cache.py
```

Delete changes to a file. Cannot be undone.

```bash
git checkout -- cache.py
```

### Moving files in git

Move a file or directory

```bash
git mv README.md README.rst
git commit -m "Changed README from markdown to restructured text"
```

Move a file or directory into another directory

```bash
git mv README.rst docs/
git commit -m "Moved readme into docs/ directory"
```

### Deleting files

Delete a file called outdated.py

```bash
git rm -- outdated.py
git commit -m "remove outdated.py"
```

Delete a directory from git

```bash
git rm -r -- old/
git commit -m "remove the old/ directory"
```

Get a directory back after deletion but before committing it.

```bash
git reset HEAD -- old/
# then check out the files from the repository
git checkout -- old/
```

Force a file to be removed

```bash
git rm -f -- outdated.py
```

### Sharing changes

Fetch changes from a remote repository

```bash
git fetch <remote name>
# changes must then be merged
```

Pull changes from a remote repository

```bash
git pull <remote name>

# pull from a repository you cloned
git pull origin

# pull but rebase your local changes on top of the remote change instead of
merging them
git pull --rebase origin <remote branch name>
```

Push changes to a remote repository

```
git push <remote name> <branch name>
```

## Organizing the repository

### Working with branches

Create a new branch from the current place in the repository

```
git branch <new branch name>
git branch feature
```

Create a new branch from another branch, tag, or commit

```
git branch <new branch name> <starting point>
git branch feature 99a-de8
```

Check out a different branch, tag and so on

```
git checkout branch
git checkout feature
```

Create a branch and check it out at the same time

```bash
git checkout -b <new branch> [<starting point>]
git checkout -b feature 644ac3a
```

Create a branch with or without tracking

```bash
git branch --track <new branch> [<starting point>]
git branch --no-track <new branch> [<starting point>]
```

View local branches

```bash
git branch
```

View all remote branches

```bash
git branch -r
```

View all branches

```bash
git branch -a
```

View all branches that are merged into the current branch. And view those that
are not.

```bash
git branch --merged
git branch --no-merged
```

View all branches that contain a particular commit

```bash
git branch --contains <commit id>
```

### Merging

Merge changes from development to the master branch

```bash
git checkout master
git merge development
```

Merge changes but don't commit them

```bash
git merge --no-commit development
```

Force the creation of a merge commit

```bash
git merge --no-ff development
```

Add a one-line log message from each merged commit to the merge message

```bash
git merge --log development
```

Specify a custom log message for a merge commit, if created

```bash
git merge -m "my message" develpment
```

Modify a commit message after committing

```bash
git merge --log --no-ff development
git commit --amend -c HEAD
# editor will launch
```

### Rebasing

Rebase current branch against master

```bash
git rebase master
```

Rebase against a tag or ID

```bash
git rebase af0fe21
```

Undo a rebase after it completes

```bash
git reset --hard ORIG_HEAD
```

### Deleting Branches

Delete a branch called experiment

```bash
git branch -d experiment
```

Delete a branch that hasn't been merged into the current branch

```bash
git branch -D experiment
```

### Tagging milestones

List all tags

```bash
git tag
```

Tag the latest commit as version 1.0 in the current branch

```bash
git tag v1.0
```

Create a tag called beta1 from the next to last commit

```bash
git tag beta1 HEAD^
```

## Working with a team

### Adding and removing remotes

Add a new remote repository

```bash
git remote add <name> <repository URL>
git remote add tswicegood git://github.com/tswicegood/bobby-tables.git
```

Remove a remote

```bash
git remote rm <name>
git remote rm tswicegood
```

Make the master branch a tracking branch.
Run these commands after you push to your remote repository for the
first time if you want to set up your local branch as a tracking branch of
the remote

```bash
git checkout origin/master
git branch -d master
git checkout -b master
```

### Retrieving remote changes (Fetching)

Fetch changes from remote repository

```bash
git fetch <remote name>
git fetch tswicegood
```

Fetch a specific branch

```bash
git fetch remote local branch:remotes/remote/remote branch
# to fetch master from origin to your local copy of the origin/master remote
branch use:
git fetch origin master:remotes/origin/master
```

Fetch the latest changes from the default remote upstream repository (if set):

```bash
git fetch
```

Fetch new branches from a specific remote upstream repository:

```bash
  git fetch remote_name
```

Fetch the latest changes from all remote upstream repositories:

```bash
  git fetch --all
```

Also fetch tags from the remote upstream repository:

```bash
  git fetch --tags
```

Delete local references to remote branches that have been deleted upstream:

```bash
  git fetch --prune
```

Fetch changes from multiple remote repositories

```bash
git fetch --multiple remote1 remote2 remote3
```

### Retrieving remote changes (Pulling)
Pulling performs a fetch to retrieve updates from a remote repository and then
merges those changes automatically.

Pull changes from a remote repository
```bash
git pull [name [branch name]]
git pull tswicegood master
```

Pull changes from a different branch into your local branch
```bash
git pull origin <remote branch>
git pull tswicegood master
```

Pull changes from a different branch into your local branch
```bash
git pull origin <remote branch>:<local branch>
git pull origin development:team-dev
```

Pull changes and rebase instead of merge
```bash
git pull --rebase origin master
```

### Sending changes to remotes

Push the local tracking branch to your origin
```bash
git push
```

Push first set of changes from master to your origin
```
git push origin master
```

Push changes from a specific branch to a specific remote repository
```bash
git push <remote name> <branch name>
git push tswicegood development
```

Push changes from the local master branch to the remote production branch
```bash
git push origin master:production
```

Force a remote branch to accept a push
```bash
git push --force
```

### Handling remote tags and branches

Push tag v1.0 to the origin
```bash
git push origin v1.0
```

Push all tags to the origin
```bash
git push --tags origin
```

Fetch remote tags and update local tags
```bash
git fetch --tags origin
```

## Branches and merging revisited

### Handling conflicts

Launch a mergetool to handle a conflict.
```bash
git mergetool
```

Set meld as the default mergetool
```bash
git config --global merge.tool "meld"
```

Use the perforce visual merge tool on windows
```bash
git config --global merge.tool p4merge
git config --global merge.tool p4merge.cmd \
'p4merge.exe \"$Base\" \"$LOCAL\"\"$REMOTE\"\"$MERGED\"'
```

### Stashing files

Stash the changes in your working tree
```bash
git stash
```

Apply a stash to the current working tree
```bash
git stash apply
```

Or to apply and remove from the stash, use:
```bash
git stash pop
```

List the available stashes
```bash
git stash list
```

Create a stash in patch mode
```bash
git stash save --patch
# launches editor
```

Delete stashes
```bash
git stash drop <stash name>

# Or remove all stashes
git stash clear
```

Create a branch from an existing stash
```bash
git stash branch [<stash name>]
```

### Cherry-Picking commits
Merge a single commit from another branch into your local one
```bash
git cherry-pick <some commit id>
git cherry-pick release_1.0
git cherry-pick a742c12
```

Cherry-pick but edit the commit message before committing
```bash
git cherry-pick --edit release_1.0
git cherry-pick -e release_1.0
```

Cherry-pick but don't commit
```bash
git cherry-pick --no-commit release_1.0
git cherry-pick -n release_1.0
```

Add a 'signed-off-by' line to the commit message
```bash
git cherry-pick --signoff release_1.0
git cherry-pick -s release_1.0
```

### Controlling how you replay commits

Start interactive rebase
```bash
git rebase -i <commit id>
git rebase -i HEAD~5
git rebase -i HEAD^^^^^
```

### Moving branches

Move branch better-widget from next-release to master
```bash
git rebase --onto master next-release better-widget
```

```
# before
master
    next-release
        better-widget

# After
master 
    next-release
    better-widget
```

## Working with the repository's history

### Viewing the log

View a reverse chronological list of all commits
```bash
git log
```

View the log with one shortened commit ID and subject
```bash
git log --oneline
```

View the last N commits
```bash
git log -N
git log -5
git log HEAD^^^^^..HEAD
git log -10
git log HEAD~10..HEAD
```

Show the changes made in the latest commit
```bash
git log -1 -p HEAD
```

### Filtering the log output

Limit the log output to a single file or directory
```bash
git log -- some/path
git log -- some_file
```

View the commits in the last week
```bash
git log --since="1 week"
git log --after="7 days"
git log --since="168 hours"
```

View the commits prior to the last week
```bash
git log --before="1 week"
git log --until="7 days"
git log --before="168 hours"
```

View the log entries by a single committer
```bash
git log --author="Some user"
```

View the log entries containing a regular expression
```bash
git log --grep="Some [Rr]eg[Ee]x"
git log --grep="some regex" --regexp-ignore-case
git log --grep="some regex" -i
```

### Comparing differences

View the differences between the current working tree and the staging area
```bash
git diff
```

View the differences between the staged changes and repository
```bash
git diff --staged
```

View the differences between the working tree and a commit in the repository
```bash
git diff HEAD
git diff Commit ID
```

View the differences between two "commits"
```bash
git diff first second
git diff first..second
git diff 23as45 1e234c
git diff 23as45..1e234c
```

Limit the diff output to a specific path
```bash
git diff -- path/
```

### Generating statistics about changes
Show stats between the last ten commits
```bash
git diff --stat HEAD~10
git diff --stat HEAD~10 HEAD
```

Show the statistics between two commits
```bash
git diff --stat first second
git diff --stat 234ef2 1e231w
```

Show the number of files changed, inserts, and delete the last ten commits
```bash
git diff --shortsat HEAD~10
```

Show stats in a parseable format
```bash
git diff --numstat HEAD~10
```

Show the patch in addition to the statistical information
```bash
git diff --stat -p HEAD^
```

Show statistics about commits in the log
```bash
git log --stat
git log --shortstat
```

### Assigning blame

Display file with entire line-by-line commit information
```bash
git blame some/file
```

Start the output of blame at line 10
```bash
git blame -L 10 some/file
```

Limit the output of blame to 10 lines 10 through 20
```bash
git blame -L 10,20 some/file
git blame -L 10,+11 some/file
git blame -L 10,-11 some/file
```

Show ten lines of output from blame starting at a posix regular expression
```bash
git blame -L "/dev to_s/",+10 some/file
```

Check the history to see the change was moved, and display that information
```bash
git blame -M some/file
```

Check the history to see whether the change was copied from somewhere else or
moved around within the file and display that information
```bash
git blame -C some/file
```

## Fixing things



