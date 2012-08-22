if [ $SSH_CONNECTION ]; then SSH="%{$fg[red]%}%n@%m "; else SSH=""; fi

PROMPT='%{$fg[yellow]%}%~%{$reset_color%} $(git_super_status)
$SSH%{$fg[green]%}❯❯%{$reset_color%} '
