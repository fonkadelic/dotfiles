source ~/.config/fish/abbreviations.fish
source ~/.config/fish/navigation.fish

# Homebrew
if test -e /opt/homebrew/bin/brew 
  eval $(/opt/homebrew/bin/brew shellenv)
end

# Exports
set -x LANGUAGE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"
set -x EDITOR vim

# Paths
fish_add_path --append ~/.dotfiles/bin
fish_add_path --append /usr/local/bin
fish_add_path --append /usr/local/sbin

# Key Bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Fisher
set -g fisher_path ~/.config/fish/packages

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Alias
alias cat="bat"
alias top="htop"
alias du="ncdu --color dark -x --exclude .git"
alias ping="prettyping --nolegend"

# Plugin Configuration
## fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -x FZF_DEFAULT_OPTS "--bind='ctrl-o:execute(vim {} < /dev/tty > /dev/tty)+abort'"

# rbenv
if type -q rbenv
  status --is-interactive; and source (rbenv init - | psub)
end

# ShellHistory
source ~/.config/fish/history.fish

