#!/bin/bash

###############################################################################
# General UI/UX                                                               #
###############################################################################

sudo scutil --set ComputerName "RyanMac"
sudo scutil --set HostName "RyanMac"
sudo scutil --set LocalHostName "RyanMac"

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# update brew
brew update
####################################################################
#                             Brew  Apps                           #
####################################################################
      ## command line tools ##
brew install mpv --with-bundle
brew linkapps mpv
brew install cloc
brew install nano
brew install vim
brew install emacs
brew install unrar
brew install midnight-commander
brew install wget
brew install git
brew install git-flow
brew install curl
brew install redis
brew install node
brew install phantomjs
brew install ssh-copy-id
     ## install app through brew cask ##
brew cask install google-chrome
brew cask install firefox
brew cask install google-drive
brew cask install dropbox
brew cask install slack
brew cask install parallels-desktop
brew cask install one-password
brew cask install pixelmator
brew cask install utorrent
brew cask install spotify
brew cask install vlc
   ## dev tools ##
brew cask install intellij-idea-ce
brew cask install atom
brew cask install github-desktop
brew cask install code-kit
brew cask install iterm2
brew cask install android-studio
brew cask install the-unarchiver
brew cask install sequel-pro
brew cask install transmit
####################################################################
#                   Atom Packages                                  #
####################################################################
apm install --quiet language-c
apm install --quiet language-objective-c
apm install --quiet language-csharp
apm install --quiet atom-beautify
apm install --quiet atom-sharp
apm install --quiet language-aspx
apm install --quiet language-fsharp
apm install --quiet language-cshtml
apm install --quiet language-puppet
apm install --quiet linter-puppet-lint
apm install --quiet language-yaml

## Clean up after installs
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# Install Xcode command line tools.
xcode-select --install

####################################################################
#                   OSX Settings options                              #
####################################################################
# Use current directory as default search scope in Finder.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Show extensions in Finder.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Quit Printer app when complete.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Reboot to a clean slate.
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
# Use OSX print dialog in Chrome.
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
# Unhide "~/Library" folder.
chflags nohidden ~/Library
# Disable Time Machine prompt for every disk.
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Set arrange by name for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist
# Set grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 96" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 96" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 96" ~/Library/Preferences/com.apple.finder.plist
# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on
# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
####################################################################
#                   iTerm 2   &    Terminal     Setup              #
####################################################################
defaults write com.googlecode.iterm2 DisableFullscreenTransparency -bool false
defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -bool true
defaults write com.googlecode.iterm2 UseLionStyleFullscreen -bool false
defaults write com.googlecode.iterm2 SUAutomaticallyUpdate -bool true
defaults write com.googlecode.iterm2 ShowFullScreenTabBar -bool true
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
defaults write com.googlecode.iterm2 HideTab -bool false
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
###############################################################################
#                               Mail                                          #
###############################################################################
# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
###############################################################################
#                               MPV                                           #
###############################################################################
mkdir -pv ~/.config/mpv
echo screenshot-template=~/Desktop/mpv-screenshot-%f-%p > ~/.config/mpv/mpv.conf
echo screenshot-format=png >> ~/.config/mpv/mpv.conf
echo no-border  >> ~/.config/mpv/mpv.conf
echo autofit-larger=100% >> ~/.config/mpv/mpv.conf
echo sub-auto=fuzzy >> ~/.config/mpv/mpv.conf
echo vo=opengl-hq:interpolation:icc-profile-auto >> ~/.config/mpv/mpv.conf
###############################################################################
# Photos                                                                      #
###############################################################################
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
###############################################################################
#                               alias setup                                   #
###############################################################################
    ## Comp322 shortcuts
echo alias lab1='cd /Users/ryandhubbard/Sites/Github/Comp322/Labs/Lab1' >> ~/.bash_profile
echo alias lab2='cd /Users/ryandhubbard/Sites/Github/Comp322/Labs/Lab2' >> ~/.bash_profile
echo alias lab3='cd /Users/ryandhubbard/Sites/Github/Comp322/Labs/Lab3'>> ~/.bash_profile
echo alias lab4='cd /Users/ryandhubbard/Sites/Github/Comp322/Labs/Lab4'>> ~/.bash_profile
echo alias lab5='cd /Users/ryandhubbard/Sites/Github/Comp322/Labs/Lab5'>> ~/.bash_profile
echo alias k200='sshpass -p hub_703319 ssh rdh29144@k200.ecs.csun.edu'>> ~/.bash_profile
echo alias wirsz='sshpass -p hub_703319 ssh rhubbard@c322.wirsz.com'>> ~/.bash_profile
    ## Folder Shortcuts
echo alias github='cd /Users/ryandhubbard/Sites/Github'>> ~/.bash_profile
########################################################################
