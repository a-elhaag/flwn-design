#!/bin/sh
# Add the flwn-design skill and its daily sync workflow to a repo. Usage: ./add-to-repo.sh owner/repo [--allow-actions-prs]
set -e
repo=${1:?usage: add-to-repo.sh owner/repo}
here=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d)
gh repo clone "$repo" "$tmp" -- -q --depth 1
cd "$tmp"
git checkout -qb chore/add-flwn-design-sync
mkdir -p .github/workflows .claude/skills/flwn-design
cp "$here/templates/sync-flwn-design.yml" .github/workflows/
cp -R "$here/flwn-design/." .claude/skills/flwn-design/
git add -A
git commit -qm "Add flwn-design skill and daily sync from a-elhaag/flwn-design"
git push -q -u origin chore/add-flwn-design-sync
gh pr create --title "Add flwn-design skill and sync" \
  --body "Adds the flwn-design skill and a daily workflow that keeps it in sync with a-elhaag/flwn-design."
# Opt-in: Actions can open PRs only if this repo setting is on. It also lets Actions approve PRs,
# so keep branch protection requiring a human review. Workflow token default stays read-only.
if [ "$2" = "--allow-actions-prs" ]; then
  gh api -X PUT "repos/$repo/actions/permissions/workflow" -f default_workflow_permissions=read -F can_approve_pull_request_reviews=true
else
  echo "Sync PRs need: Settings > Actions > General > Allow GitHub Actions to create and approve pull requests."
  echo "Rerun with --allow-actions-prs to set it via gh (also lets Actions approve PRs)."
fi
