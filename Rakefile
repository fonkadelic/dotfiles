require 'rake'

desc "Hook dotfiles into system-standard positions."
task :install => [:submodules] do

  Rake::Task['brew'].invoke
  
  linkables = []
  linkables += Dir.glob('git/*') if want_to_install?('git')
  linkables += Dir.glob('{vim,vimrc}') if want_to_install?('vim')
  linkables += Dir.glob('{zsh,zshrc}') if want_to_install?('zsh')
  
  Rake::Task['omz'].invoke

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    file = linkable.split('/').last
    source = "#{ENV["PWD"]}/#{linkable}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "--------"
    puts "file:   #{file}"
    puts "source: #{source}"
    puts "target: #{target}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" } if backup || backup_all
    end
    run %{ ln -s "#{source}" "#{target}" }
  end
  success_msg("installed")
end

task :omz do
  if File.exist?("#{ENV['HOME']}/.oh-my-zsh")
    run %{ ln -nfs #{ENV["PWD"]}/oh-my-zsh/plugins $HOME/.oh-my-zsh/custom/ } if want_to_install?('zsh plugins')
    run %{ ln -nfs #{ENV["PWD"]}/oh-my-zsh/themes/* $HOME/.oh-my-zsh/custom/ } if want_to_install?('zsh themes')
  end
end

desc "Install homebrew & some packages"
task :brew do
  puts "======================================================"
  puts "Installing Homebrew, the OSX package manager...If it's"
  puts "already installed, this will do nothing."
  puts "======================================================"
  run %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
  puts
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  run %{brew install ack ctags git hub rbenv ruby-build z tree macvim --override-system-vim}
  puts
  puts
end

desc "Init and update submodules."
task :submodules do
  sh('git submodule update --init --recursive')
end

task :default => :install

private
def run(cmd)
  puts
  puts "[Installing] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def want_to_install?(section)
  puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
  STDIN.gets.chomp == 'y'
end

def success_msg(action)
  puts "Dotfiles #{action}. Restart terminal and vim."
end
