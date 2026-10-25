#!/bin/bash

workspaces=$(i3-msg -t get_workspaces | jq -r '.[].name')
current=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')

[[ "$current" =~ ^[0-9]+$ ]] || exit 1
current=$((10#$current))

# Keep numeric workspace names and sort them
mapfile -t numbers < <(
  printf '%s\n' "$workspaces" |
    grep -E '^[0-9]+$' |
    sort -n -u
)

# Choose up to 3 existing workspaces nearest to current
selected=$(
  printf '%s\n' "${numbers[@]}" |
    awk -v c="$current" '
        { distance = $1 - c; if (distance < 0) distance = -distance }
        { print distance, $1 }
        ' |
    sort -n -k1,1 -k2,2n |
    head -n 3 |
    awk '{ print $2 }'
)

# Display them in numerical order
while IFS= read -r n; do
  if ((n == current)); then
    printf '%%{B#34283c} %s %%{B-}' "$n"
  else
    printf ' %s ' "$n"
  fi
done < <(printf '%s\n' "$selected" | sort -n)

printf '\n'
