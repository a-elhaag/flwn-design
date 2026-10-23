# flwn-design

Source of truth for the Flwn design skill (`flwn-design/SKILL.md`, logo, palette, mockup).

Edit the skill here only. A push to `main` runs `.github/workflows/sync.yml`, which opens a PR in each Flwn repo
that copies `flwn-design/` into `.claude/skills/flwn-design/`.

## Setup

Add a repository secret `SYNC_TOKEN`: a fine-grained personal access token with access to the target repos and
permissions Contents (read and write) and Pull requests (read and write).

## Target repos

Listed in the matrix in `.github/workflows/sync.yml`. Add a repo there to include it.
