function __fish_xcodes_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq (count $argv) ]
        for i in (seq (count $argv))
            if [ $cmd[$i] != $argv[$i] ]
                return 1
            end
        end
        return 0
    end
    return 1
end
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'download' -d 'Download a specific version of Xcode'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'install' -d 'Download and install a specific version of Xcode'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'installed' -d 'List the versions of Xcode that are installed'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'list' -d 'List all versions of Xcode that are available to install'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'select' -d 'Change the selected Xcode'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'uninstall' -d 'Uninstall a version of Xcode'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'update' -d 'Update the list of available versions of Xcode'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'version' -d 'Print the version number of xcodes itself'
complete -c xcodes -n '__fish_xcodes_using_command xcodes' -f -a 'help' -d 'Show subcommand help information.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -l latest -d 'Update and then download the latest non-prerelease version available.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -l latest-prerelease -d 'Update and then download the latest prerelease version available, including GM seeds and GMs.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -r -l aria2 -d 'The path to an aria2 executable. Searches $PATH by default.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download --aria2' -f -a '(for i in *.{}; echo $i;end)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -l no-aria2 -d 'Don\'t use aria2 to download Xcode, even if its available.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -r -l directory -d 'The directory to download Xcode to. Defaults to ~/Downloads.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -r -l data-source -d 'The data source for available Xcode versions.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download --data-source' -f -k -a 'apple xcodeReleases'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes download' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -r -l path -d 'Local path to Xcode .xip'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install --path' -f -a '(for i in *.{xip}; echo $i;end)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -l latest -d 'Update and then install the latest non-prerelease version available.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -l latest-prerelease -d 'Update and then install the latest prerelease version available, including GM seeds and GMs.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -r -l aria2 -d 'The path to an aria2 executable. Searches $PATH by default.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install --aria2' -f -a '(for i in *.{}; echo $i;end)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -l no-aria2 -d 'Don\'t use aria2 to download Xcode, even if its available.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -r -l directory -d 'The directory to install Xcode into. Defaults to /Applications.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -r -l data-source -d 'The data source for available Xcode versions.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install --data-source' -f -k -a 'apple xcodeReleases'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes install' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes installed' -f -r -l directory -d 'The directory where your Xcodes are installed. Defaults to /Applications.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes installed --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes installed' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes installed' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes list' -f -r -l directory -d 'The directory where your Xcodes are installed. Defaults to /Applications.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes list --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes list' -f -r -l data-source -d 'The data source for available Xcode versions.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes list --data-source' -f -k -a 'apple xcodeReleases'
complete -c xcodes -n '__fish_xcodes_using_command xcodes list' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes list' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes select' -f -s p -l print-path -d 'Print the path of the selected Xcode'
complete -c xcodes -n '__fish_xcodes_using_command xcodes select' -f -r -l directory -d 'The directory where your Xcodes are installed. Defaults to /Applications.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes select --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes select' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes select' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes uninstall' -f -r -l directory -d 'The directory where your Xcodes are installed. Defaults to /Applications.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes uninstall --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes uninstall' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes uninstall' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes update' -f -r -l directory -d 'The directory where your Xcodes are installed. Defaults to /Applications.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes update --directory' -f -a '(__fish_complete_directories)'
complete -c xcodes -n '__fish_xcodes_using_command xcodes update' -f -r -l data-source -d 'The data source for available Xcode versions.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes update --data-source' -f -k -a 'apple xcodeReleases'
complete -c xcodes -n '__fish_xcodes_using_command xcodes update' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes update' -f -l no-color
complete -c xcodes -n '__fish_xcodes_using_command xcodes version' -f -l color -d 'Determines whether output should be colored.'
complete -c xcodes -n '__fish_xcodes_using_command xcodes version' -f -l no-color
