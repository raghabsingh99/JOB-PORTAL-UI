#!/usr/bin/env bash
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

if [ -n "$used" ]; then
  # Build a 15-block progress bar
  filled=$(awk -v pct="$used" 'BEGIN { v=int(pct/100*15 + 0.5); if(v>15) v=15; print v }')
  empty=$((15 - filled))

  # Pick bar colour: green → yellow → red as usage climbs
  if awk -v p="$used" 'BEGIN { exit !(p < 50) }'; then
    bar_color="\033[32m"   # green
  elif awk -v p="$used" 'BEGIN { exit !(p < 80) }'; then
    bar_color="\033[33m"   # yellow
  else
    bar_color="\033[31m"   # red
  fi

  bar=""
  i=0
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$((i+1)); done
  i=0
  while [ $i -lt $empty ];  do bar="${bar}░"; i=$((i+1)); done

  pct_label=$(printf "%.0f" "$used")
  printf "\033[1;36m%s\033[0m  %b%s\033[0m \033[90m%s%%\033[0m" \
    "$model" "$bar_color" "$bar" "$pct_label"
else
  printf "\033[1;36m%s\033[0m" "$model"
fi
