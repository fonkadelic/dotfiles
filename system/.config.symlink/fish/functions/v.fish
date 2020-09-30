function v
  if test (count $argv) -gt 0
    command $EDITOR $argv
  else
    vim (fzf)
  end
end
