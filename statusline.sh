#!/usr/bin/env bash
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

if [ -n "$used" ]; then
  filled=$(awk -v pct="$used" 'BEGIN {v=int(pct/10 + 0.5); if(v>10) v=10; print v}')
  empty=$((10 - filled))
  bar=""
  i=0
  while [ $i -lt $filled ]; do bar="${bar}█"; i=$((i+1)); done
  i=0
  while [ $i -lt $empty ]; do bar="${bar}░"; i=$((i+1)); done
  pct=$(printf "%.0f" "$used")
  printf "\033[1;36m%s\033[0m \033[90m[%s]\033[0m \033[33m%s%%\033[0m" "$model" "$bar" "$pct"
else
  printf "\033[1;36m%s\033[0m" "$model"
fi
