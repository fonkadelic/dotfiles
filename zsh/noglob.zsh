# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'


# Remove prezto alias
unalias g

# Show status if there is no command
g() {
  if [[ $# > 0 ]]; then
	git $@
  else
	git status
  fi
}

# Complete g like git
compdef g=git