function fzf-git-branch -d "Fuzzy search and print git branch name"
  git-is-repo; or return 

  git branch --color=always --all --sort=-committerdate |
        rg -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" (echo {} | sed "s/.* //")' |
        sed "s/.* //"
end
