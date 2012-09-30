# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias llg='ll | grep'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Hub (http://defunkt.io/hub/)
#alias git="hub"

# MacVim
alias v="bl_mvim"

# set my osx defaults
alias osx="bl_osx"

# extract archives
alias extract="bl_extract"

# restart quicklook
alias restartql="qlmanage -r"

# get ip
alias localip="bl_localip"
alias globalip="dig +short myip.opendns.com @resolver1.opendns.com"

# Copy pub keys to clipboard
alias pubkey="cat $HOME/.ssh/*.pub | pbcopy && echo 'Keys copied to clipboard'"

# Cuttiing edge CocoaPods 
alias pod-dev='$HOME/Dev/Ruby/CocoaPods/bin/pod'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Custom rsync
alias blsync='rsync --progress --partial --rsh="ssh"'

# Jenkins CI
alias jenkins="bl_jenkins"
