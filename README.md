# Algorithms Repository Manager

This repository provides a set of scripts to manage local clones of [The Algorithms](https://github.com/TheAlgorithms) open-source resource for various programming languages.

## Supported Languages

The languages managed by this repository are listed in `languages.txt`:
<!-- LANGUAGES_START -->
- Python
- Java
- C-Plus-Plus
- JavaScript
- Go
- Rust
<!-- LANGUAGES_END -->

## Usage

A `Makefile` is provided to simplify common tasks.

### Synchronize Gitignore
Automatically updates `.gitignore` to ignore the cloned language directories.
```bash
make sync-gitignore
```

### Clone All Repositories
Clones the latest version (shallow clone) of all repositories listed in `languages.txt`.
```bash
make clone-all
```

### Update All Repositories
Fetches and pulls the latest changes for all existing local repositories.
```bash
make update-all
```

### Pre-commit Hooks
This repository uses `pre-commit` to ensure code quality. To install and set up the hooks:
```bash
make install-hooks
```
The hooks will then run automatically on every `git commit`.

## Structure
- `languages.txt`: List of target languages/repositories.
- `clone_repos.sh`: Script to handle shallow cloning from GitHub.
- `update_repos.sh`: Script to handle bulk updates of local clones.
- `Makefile`: Entry point for management commands.
