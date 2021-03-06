#!/bin/bash

## Xcode
echo 'Install Xcode'
	xcode-select --install || true


## RVM
echo 'Install RVM stable'	
	curl -sSL https://get.rvm.io | bash -s stable --ruby || true


## Homebrew & Cask
echo 'Install Homebrew and cask...'
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || true
	brew tap homebrew/science || true
	brew tap phinze/cask || true
	brew tap caskroom/cask || true
	brew install brew-cask || true
	# brew cask search || true
	# brew cask uninstall app || true


## Core 
CORE=(mas
	tree
	wget
	get-flow
	python3
	# php71
	# node
	# go
	nvm
	pyenv
	# mysql
	# postgresql
	# sqlite3
	mongodb
	# neo4j
	httpie
	macvim
	htop
	tmux
	# ant
	# ffmpeg
	# eigen
	# opencv
	)
echo 'Install Core...'
for app in ${CORE[@]}
do
	brew install $app || true
done
brew install yarn --without-node || true


## Core Functionality
FUNC=(vlc
	evernote
	adobe-acrobat-reader
	# alfred
	# dropbox
	# little-snitch
	# transmit
	# iterm2
	# java
	# clamxav
	)
APPDIR="/Applications"
echo 'Install Core Functionality Apps...'
for app in ${FUNC[@]}
do
	brew cask install --appdir="${APPDIR}" $app || true
done


## Development
DEV=(sublime-text
	virtualbox
	jetbrains-toolbox
	visual-studio-code
	# webstorm
	# pycharm-pro
	# rubymine
	tower
	macDown
	kap
	# light-table
	# vagrant
	# sourcetree
	# charles
	# easyfind
	# github
	# heroku-toolbelt
	)
APPDIR="/Applications"
echo 'Install Dev Apps...'
for app in ${DEV[@]}
do
	brew cask install --appdir="${APPDIR}" $app || true
done


## Google Slavery
GOOGLE=(google-chrome
	# google-drive
	# google-music-manager
	# google-earth
	# chromecast
	)
APPDIR="/Applications"
echo 'Install Google Apps...' # | Chrome not included cause of 1Password Plugin
for app in ${GOOGLE[@]}
do
	brew cask install --appdir="${APPDIR}" $app || true
done


## Nice to have
NICE=(slack
	skype
	tunnelbear
	grammarly
	kodi
	qBittorrent
	firefox
	spotify
	# spotify-notifications
	# jdownloader
	# lastfm
	# all2mp3
	)
APPDIR="/Applications"
echo 'Install Some additional Apps...'
for app in ${NICE[@]}
do
	brew cask install --appdir="${APPDIR}" $app || true
done


## Apps to Dock
DOCK=('Google Chrome.app'
	'Sublime Text.app'
	'Spotify.app'
	'Slack.app'
	# 'TunnelBear.app'
	# 'Grammarly.app'
	)
echo 'Adding Apps to dock...'
for ((i=0; i<${#DOCK[@]}; i++))
do
	defaults write com.apple.dock persistent-apps -array-add \
		"<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string> \
		/Applications/${DOCK[$i]} \
		</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>" || true
done
killall Dock || true


## Aliases
ALIASES=("ll='ls -lahG'"
	"py='python3 -W ignore'"
	"heineken='brew update && brew upgrade && brew cleanup; brew doctor'"
	)
echo 'Aliases to .bash_profile...'
cd ~ && echo ' ' > .bash_profile
for ((i=0; i<${#ALIASES[@]}; i++))
do
	echo "alias ${ALIASES[$i]}" >> .bash_profile || true
done
echo "source ~/.profile" >> .bash_profile


## Paths
echo 'Paths to .profile'
	cd ~ && echo ' ' > .profile
	echo '# Add NVM to PATH for scripting.' >> .profile
	echo 'export NVM_DIR="$HOME/.nvm"' >> .profile
	echo '[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" # This loads nvm' >> .profile
	echo ' ' >> .profile
	echo '# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.' >> .profile
	echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> .profile
	source .bash_profile


## Auto start
echo 'Autostart mongodb service'
	ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents || true
	launchctl load -wF ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist || true


## Cleanup
echo 'Cleanup...'
	brew update && brew upgrade && brew cleanup || true
	brew doctor || true