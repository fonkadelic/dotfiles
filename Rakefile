require 'rake'
require 'fileutils'
require File.join(File.dirname(__FILE__), 'bin', 'yadr', 'vundle')

class String
  def self.colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def green
    self.class.colorize(self, 32)
  end
end

desc "Hook dotfiles into system-standard positions."
task :install => [:submodules, :brew] do
  file_operation(Dir.glob('git/*')) if want_to_install?('git')
  file_operation(Dir.glob('ruby/*')) if want_to_install?('ruby')
  file_operation(Dir.glob('ack/*')) if want_to_install?('ack')
  file_operation(Dir.glob('lldb/*')) if want_to_install?('lldb')
  if want_to_install?('vim')
    file_operation(Dir.glob('{vim,vimrc,xvimrc}'))
  end

  task(:prezto).invoke

  success_msg("installed")
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

desc "Runs Vundle installer in a clean vim environment"
task :vundle do
  puts "======================================================"
  puts "Installing vundle."
  puts "======================================================"
  puts ""

  run %{
    cd $HOME/.dotfiles
    git clone https://github.com/gmarik/vundle.git #{File.join('vim','bundle', 'vundle')}
  }

  Vundle::update_vundle
end

task :default => :install

private
def run(cmd)
  puts
  puts "[Installing] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    puts "======================================================"
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
  end
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  run %{ brew bundle $HOME/.dotfiles/Brewfile }
  run %{ brew bundle $HOME/.dotfiles/Caskfile }
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
  puts "Setting zsh as your default shell"
  run %{ chsh -s /bin/zsh }
end

def want_to_install?(section)
  if ENV["ask"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    should_install = STDIN.gets.strip
    should_install.downcase == 'y'
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
  puts "Dotfiles #{action}. Restart terminal and vim.".green
end
