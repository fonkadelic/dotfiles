require 'rake'

desc "Hook dotfiles into system-standard positions."
task :install => [:submodules] do

  Rake::Task['brew'].invoke
  
  file_operation(Dir.glob('git/*')) if want_to_install?('git')
  file_operation(Dir.glob('ruby/*')) if want_to_install?('ruby')
  file_operation(Dir.glob('{vim,vimrc}')) if want_to_install?('vim')
  
  Rake::Task["prezto"].invoke

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
  install_homebrew
end

desc "Install Prezto (ZSH Enhancements)"
task :prezto do
  if want_to_install?('zsh enhancements & prezto')
    install_prezto
  end
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

def install_homebrew
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
  run %{brew install ack ctags git hub rbenv ruby-build z ssh-copy-id tree macvim --override-system-vim}
  puts
  puts
end

def install_prezto
  puts "======================================================"
  puts "Installing Prezto (ZSH Enhancements)..."
  puts "======================================================"

  unless File.exists?(File.join(ENV['ZDOTDIR'] || ENV['HOME'], ".zprezto"))
    run %{ ln -nfs "$HOME/.dotfiles/zsh/prezto" "${ZDOTDIR:-$HOME}/.zprezto" }

    # The prezto runcoms are only going to be installed if zprezto has never been installed
    file_operation(Dir.glob('zsh/prezto/runcoms/z*'), :copy)
  end

  puts
  puts "Overriding prezto ~/.zpreztorc with YADR's zpreztorc to enable additional modules..."
  run %{ ln -nfs "$HOME/.dotfiles/zsh/prezto-override/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc" }

  puts
#  puts "Creating directories for your customizations"
#  run %{ mkdir -p $HOME/.zsh.before }
#  run %{ mkdir -p $HOME/.zsh.after }
#  run %{ mkdir -p $HOME/.zsh.prompts }

  puts "Setting zsh as your default shell"
  run %{ chsh -s /bin/zsh }
end

def want_to_install?(section)
  if ENV["ask"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def file_operation(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) || File.symlink?(target)
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

    if file == 'zshrc'
      File.open(target, 'a') do |zshrc|
        zshrc.puts('for config_file ($HOME/.dotfiles/zsh/*.zsh) source $config_file')
      end
    end

    puts "=========================================================="
    puts
  end
end

def success_msg(action)
  puts "Dotfiles #{action}. Restart terminal and vim."
end
