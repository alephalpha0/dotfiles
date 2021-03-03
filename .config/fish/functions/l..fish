# -a all files / -l long format / -h header row to columns
# -F type indicator
function l.
  command exa -alhF --git -s=name --time-style=long-iso --group-directories-first --color-scale --icons $argv
end
