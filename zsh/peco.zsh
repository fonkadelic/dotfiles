if which peco &> /dev/null; then
  function peco-select-history() {
	local tac
	(which gtac &> /dev/null && tac="gtac") || \
	  (which tac &> /dev/null && tac="tac") || \
	  tac="tail -r"
	BUFFER=$(fc -l -n 1 | eval $tac | \
				peco --layout=bottom-up --query "$LBUFFER")
	CURSOR=$#BUFFER # move cursor
	zle -R -c       # refresh
  }
  zle -N peco-select-history
  bindkey '^R' peco-select-history
  
  function peco-ag-choc() {
	choc $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-l " $2 " " $1}')
  }
  zle -N peco-ag-choc
fi
