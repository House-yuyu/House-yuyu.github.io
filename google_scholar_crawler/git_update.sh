#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_root="$(git -C "${root}" rev-parse --show-toplevel)"
results="${root}/results"
python="${root}/.venv/bin/python"

if [[ ! -x "${python}" ]]; then
  printf '%s\n' "Missing ${root}/.venv. Create it and install requirements first." >&2
  exit 1
fi

export GOOGLE_SCHOLAR_ID="${GOOGLE_SCHOLAR_ID:-xDDy-DwAAAAJ}"
"${python}" "${root}/main.py"

remote="$(git -C "${repository_root}" remote get-url --push origin)"
git -C "${results}" init --quiet
git -C "${results}" config user.name "Google Scholar Updater"
git -C "${results}" config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git -C "${results}" add gs_data.json gs_data_shieldsio.json

if git -C "${results}" diff --cached --quiet; then
  printf '%s\n' "Google Scholar data is unchanged."
else
  git -C "${results}" commit -m "Update Google Scholar statistics"
  git -C "${results}" push "${remote}" HEAD:google-scholar-stats --force
  printf '%s\n' "Google Scholar data pushed successfully."
fi
