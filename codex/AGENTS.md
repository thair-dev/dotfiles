## Environment

Tools expected:
rg, fd, fzf, git, python 3.13, uv

## Rules

- Use Windows-native tools and paths
- Do not use WSL, bash, or Unix-only assumptions
- Prefer CLI verification over assumptions
- Use rg for search and fd for file discovery
- Use git status and git diff to validate changes
- If a CLI command fails or tools appear missing:
  - Assume sandbox limitation
  - Request escalation and retry the same command
- Keep solutions minimal

## Workflow

1. fd
2. rg
3. minimal edits
4. git diff
