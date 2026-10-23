# flwn-design

Source of truth for the Flwn design skill (`flwn-design/`: SKILL.md, logo, palette, mockup). Edit the skill here only.

## How repos stay in sync

Each Flwn repo has `.github/workflows/sync-flwn-design.yml` (template in `templates/`). It runs daily and on demand
(Actions tab, Run workflow), copies `flwn-design/` into `.claude/skills/flwn-design/` and opens or updates the PR
`chore/sync-flwn-design`. No token needed: this repo is public and the workflow uses the repo's own `GITHUB_TOKEN`.
The repo setting "Allow GitHub Actions to create and approve pull requests" must be on.

## New repo

```
./add-to-repo.sh owner/repo
```

Opens a PR that adds the skill and the workflow. Add `--allow-actions-prs` to also turn on the Actions setting above via gh.
That setting also lets Actions approve PRs, so keep branch protection requiring a human review. The workflow token stays read-only by default.
