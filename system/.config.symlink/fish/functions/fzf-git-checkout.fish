function fzf-git-checkout -d "Fuzzy search and checkout a git branch"
  git-is-repo; or return 

  set -l branch (fzf-git-branch)

  if test -z "$branch"
    echo 'No branch selected'
    return
  end

  # If branch name starts with 'remotes/' then it is a remote branch. By
  # using --track and a remote branch name, it is the same as:
  # git checkout -b branchName --track origin/branchName
  if string match -q 'remotes/*' $branch
    git checkout --track $branch
  else
    git checkout $branch;
  end
end
