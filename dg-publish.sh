#!/usr/bin/env bash
# dg-publish.sh
###################
#
# This script adds a "dg-publish: true" to all *.md files that don't have
# a "dg-publish: " defined in it's frontmatter.
#
# Consequences of this:
# - non versioned files won't be affected (e.g.: gitignored files)
# - files without any frontmatter will have one with "dg-publish: true"
# - files with a "dg-publish: " (any value) in its frontmatter won't be touched
#
# WARNING: understand what this script does before using it!!!
#
# This script was created to be used in my Obsidian vault and to publish my
# digital garden using this awesome plugin:
# https://github.com/oleeskild/obsidian-digital-garden
#
#
# meleu - https://meleu.dev/

set -euo pipefail

listMdFiles() {
  git ls-files --exclude='*.md' --ignored --cached
}

includePublishFrontmatter() {
  local mdFile="$1"

  # if file doesn't have a frontmatter, add an empty one
  [[ $(head -1 "${mdFile}") == '---' ]] \
    || sed --in-place '1i ---\n---' "${mdFile}"

  # if file doesn't have a "dg-publish:" in the frontmatter
  # add one defaulting to 'true'
  sed '1,/---/!d' "${mdFile}" \
    | grep --quiet 'dg-publish:' \
    || (
      sed --in-place '2i dg-publish: true' "${mdFile}"
      echo "'${mdFile}': published" >&2
    )
}

main() {
  local mdFile
  local mdFiles=()

  mapfile -t mdFiles < <(listMdFiles)

  for mdFile in "${mdFiles[@]}"; do
    [[ ! -f "${mdFile}" || "${mdFile}" == "templates/"* ]] && continue
    includePublishFrontmatter "${mdFile}"
  done
}

main "$@"
