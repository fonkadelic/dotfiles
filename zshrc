# Path to oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Load OMZ-Theme (can be found in ~/.oh-my-zsh/themes/*)
export ZSH_THEME="fonkadelic"

# Load OMZ-Plugins (can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git brew textmate pod git-prompt gem) 

source $ZSH/oh-my-zsh.sh

# Load configurations
for config_file ($HOME/.zsh/*.zsh) source "$config_file"

# Init z
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

# Init rbenv
eval "$(rbenv init -)"

