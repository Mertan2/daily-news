#!/usr/bin/env bash
# Commit & push today's news briefings to GitHub Pages.
# Invoked by the news-check routine after it rewrites the HTML reports.

set -euo pipefail

cd "$(dirname "$0")"

git add index.html daily-briefing.html weekly-report.html specific-topics.html
# learning-goals.html is optional; only stage it if it exists this run.
[ -f learning-goals.html ] && git add learning-goals.html

if git diff --cached --quiet; then
  echo "publish.sh: nothing new to publish."
  exit 0
fi

git commit -m "News briefing $(date +%F)" --quiet
git push --quiet
echo "Published → https://mertan2.github.io/daily-news/"
