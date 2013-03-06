#!/usr/bin/env ruby

git_bundles = %w{
	git://github.com/myusuf3/numbers.vim.git
	git://github.com/Lokaltog/vim-powerline.git
	git://github.com/tpope/vim-surround.git
	git://github.com/altercation/vim-colors-solarized.git	
  git://github.com/tomtom/tcomment_vim.git
  git://github.com/nathanaelkane/vim-indent-guides.git
  git://github.com/kana/vim-arpeggio.git
  git://github.com/scrooloose/nerdtree.git
  git://github.com/jistr/vim-nerdtree-tabs.git
  git://github.com/vim-scripts/IndexedSearch.git  
  git://github.com/sjbach/lusty.git
  git://github.com/Raimondi/delimitMate.git
  git://github.com/vim-scripts/SearchComplete.git
  git://github.com/tjennings/git-grep-vim.git
  git://github.com/airblade/vim-gitgutter.git
}

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.rm_rf(bundles_dir)
FileUtils.mkdir(bundles_dir)
FileUtils.cd(bundles_dir)

git_bundles.each do |url|
	puts url
	folder_name = url.split('/').last.chomp('.git').gsub(/vim-|[._]vim/, '')
	`git clone -q #{url} #{folder_name}`
end

# Remove Git-Repos
Dir["*/.git"].each {|f| FileUtils.rm_rf(f) }
