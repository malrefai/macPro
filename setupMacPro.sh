#!/bin/bash

## Xcode
echo 'Install Xcode'
	xcode-select --install || true


## RVM
echo 'Install RVM stable'
	curl -sSL https://get.rvm.io | bash -s stable --ruby || true


## Homebrew & Cask
echo 'Install Homebrew and cask...'
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" || true
	brew tap homebrew/science || true
	brew tap phinze/cask || true
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
	# go
	# node
	nvm
	pyenv
	# mysql
	# postgresql
	# sqlite3
	mongodb
	# neo4j
	httpie
	macvim
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
	wunderlist
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
	# webstorm
	# pycharm-pro
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
	spotify
	# spotify-notifications
	# firefox
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
	'Wunderlist.app'
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
cd ~ && echo "" > .bash_profile
for ((i=0; i<${#ALIASES[@]}; i++))
do
	echo "alias ${ALIASES[$i]}" >> .bash_profile || true
done
echo "source ~/.profile" >> .bash_profile


## Paths
echo 'Paths to .profile'
	cd ~
	echo '# Add NVM to PATH for scripting.' >> .profile
	echo 'export NVM_DIR="$HOME/.nvm"' >> .profile
	echo '[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" # This loads nvm' >> .profile
	source .bash_profile


## Cleanup
echo 'Cleanup...'
	heineken || true