function g -w git
  if test (count $argv) -eq 0
    set -l time_since_last_commit (git log -1 --pretty=format:"%ar" 2> /dev/null | sed 's/\([0-9]*\) \(.\).*/\1\2/')
    if test -n "$time_since_last_commit"
      echo Last commit: $time_since_last_commit ago
    end
    git status --short --branch
  else
    git $argv
  end
end
