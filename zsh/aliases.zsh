# Show human friendly numbers and colors
alias df='df -h'
alias ll='ls -alGh'
alias du='du -h -d 2'

# show me files matching "ls grep"
alias llg='ll | grep'
alias lla='ll | ag'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# MacVim
alias v="bl_mvim"

# VimR
alias vimr='open -a "VimR"'

# Emacs
alias em='open -a Emacs.app'

# iA Writer
alias ia='open $1 -a /Applications/iA\ Writer.app'

# Tmux
alias tat="bl_tat"

# SourceTree
alias st="stree"

# GitUp
alias gu="gitup"

# set my osx defaults
alias osx="bl_osx"

# quick opening files with editor
# alias e="j -a -e $EDITOR"
alias e='j -a -e "open -a Emacs.app"'

# edit vim keymapping
alias vikey="vim $ZSH/zsh/aliases.zsh"

# extract archives
alias extract="bl_extract"

# restart quicklook
alias ql-restart="qlmanage -r"

# get ip
alias localip="bl_localip"
alias globalip="dig +short myip.opendns.com @resolver1.opendns.com"

# Copy pub keys to clipboard
alias pubkey="cat $HOME/.ssh/*.pub | pbcopy && echo 'Keys copied to clipboard'"

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Custom rsync
alias blsync='rsync --progress --partial --rsh="ssh"'

# tmuxinator
alias mux="tmuxinator"

# Ruby
alias be='bundle exec'
alias bp='bundle exec pod'

# Gradle
alias gw='./gradlew'

# Jenkins
alias jenkins-ios-sh='ssh bernhard.loibl@jenkins-ios-master.kupferwerk.net -p 49178 -i .ssh/kupferwerk_rsa'

# Xcode
alias oxcdd='xcderiveddata | xargs -I{} open {}'

# Chill
alias chill="mpv -no-video 'https://www.youtube.com/watch?v=hHW1oY26kxQ'"

