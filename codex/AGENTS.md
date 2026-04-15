## Environment

Tools available:
rg, fd, fzf, git, python 3.13, uv

## Rules

- Prefer CLI verification over assumptions when possible
- Use Windows-native tools and paths
- Do not use WSL, bash, or Unix-only assumptions
- Use rg for search
- Use fd for file discovery
- Use git status and git diff to validate changes
- If a CLI command fails, report the failure instead of guessing
- Keep solutions minimal and production-grade

## Workflow

1. Discover files with fd
2. Search with rg
3. Apply minimal, targeted edits
4. Validate with git diff
