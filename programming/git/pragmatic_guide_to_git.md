# Pragmatic guide to git

## Configuration

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
Undo staged changes to an existing file
```bash
git reset HEAD
```

Undo staged new-file
```bash
git rm --cached
```
