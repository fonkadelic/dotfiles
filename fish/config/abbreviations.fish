if status --is-interactive
  abbr --add --global gu 'gitup'
  abbr --add --global rsync 'rsync -avAX --progress'
  abbr --add --global help 'tldr'
  abbr --add --global bp 'bundle exec pod'
  abbr --add --global gw './gradlew'
  abbr --add --global o 'open'
  abbr --add --global simurl 'xcrun simctl openurl booted'
  abbr --add --global gco 'fzf-git-checkout'
  abbr --add --global odd 'xcderiveddata | xargs -I{} open {}'
  abbr --add --global filehistory 'fzf --print0 | xargs -0 -o ksdiff'
  abbr --add --global lofi 'mpv --no-video "https://www.youtube.com/watch?v=jfKfPfyJRdk"'
end
