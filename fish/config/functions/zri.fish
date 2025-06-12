function zri
  command zellij run --name "$argv" --in-place -- fish -c "$argv"
end

