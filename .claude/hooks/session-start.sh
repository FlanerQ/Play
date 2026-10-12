#!/bin/bash
# Run every top-level project's setup.sh so dependencies are ready in cloud sessions.
# One project failing doesn't block the session; its log path is reported instead.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"

log_dir="${TMPDIR:-/tmp}/play-setup"
mkdir -p "$log_dir"

for setup in */setup.sh; do
  [ -f "$setup" ] || continue
  project=$(dirname "$setup")
  log="$log_dir/$project.log"
  if (cd "$project" && bash ./setup.sh) >"$log" 2>&1; then
    echo "setup ok: $project"
  else
    echo "setup FAILED: $project (log: $log)"
  fi
done

exit 0
