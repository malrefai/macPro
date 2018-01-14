#!/bin/sh

echo 'Append Aliases to .bash_profile'
	cd ~
	echo "alias ll='ls -lahG'" >> .bash_profile
	echo "alias py='python3 -W ignore'" >> .bash_profile
	echo "alias heineken='brew update && brew upgrade && brew cleanup; brew doctor'" >> .bash_profile
	echo "export PATH=/usr/local/bin:$PATH" >> .bash_profile
	echo "source ~/.profile" >> .bash_profile
	source .bash_profile


echo 'Install Xcode'
	xcode-select --install


echo 'Install RVM stable'
	curl -sSL https://get.rvm.io | bash -s stable --ruby


echo 'Install Homebrew and cask...'
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	brew tap homebrew/science
	brew tap phinze/cask
	brew install brew-cask
	# brew cask search
	# brew cask uninstall app


## Core 
echo 'Install Core...'
	brew install mas
	brew install wget
	brew install get-flow
	# brew install go
	brew install php71
	brew install node
	brew install python3
	# brew install mysql
	# brew install postgresql
	# brew install sqlite3
	# brew install mongodb
	# brew install neo4j
	brew install macvim
	# brew install ant
	# brew install ffmpeg
	# brew install eigen
	# brew install opencv
	# npm install -g gitjk
	# sudo npm install -g cordova
	# npm install phonegap -g


## Core Functionality
echo 'Install Core Apps...'
	# brew cask install --appdir="/Applications" alfred
	# brew cask install --appdir="/Applications" dropbox
	# brew cask install --appdir="/Applications" little-snitch
	# brew cask install --appdir="/Applications" transmit
	# brew cask install --appdir="/Applications" iterm2
	# brew cask install --appdir="/Applications" java
	# brew cask install --appdir="/Applications" clamxav
	# brew cask install --appdir="/Applications" wunderlist
	brew cask install --appdir="/Applications" vlc
	brew cask install --appdir="/Applications" evernote
	brew cask install --appdir="/Applications" adobe-acrobat-reader



## Development
echo 'Install Dev Apps...'
	# brew cask install --appdir="/Applications" github
	# brew cask install --appdir="/Applications" heroku-toolbelt
	brew cask install --appdir="/Applications" sublime-text
	brew cask install --appdir="/Applications" jetbrains-toolbox
	# brew cask install --appdir="/Applications" webstorm
	# brew cask install --appdir="/Applications" pycharm-pro
	# brew cask install --appdir="/Applications" light-table
	brew cask install --appdir="/Applications" virtualbox
	# brew cask install --appdir="/Applications" vagrant
	# brew cask install --appdir="/Applications" sourcetree
	# brew cask install --appdir="/Applications" charles
	# brew cask install --appdir="/Applications" easyfind


## Google Slavery
# echo Install Google Apps | Chrome not included cause of 1Password Plugin
	brew cask install --appdir="/Applications" google-chrome
	# brew cask install --appdir="/Applications" google-drive
	# brew cask install --appdir="/Applications" google-music-manager
	# brew cask install --appdir="/Applications" google-earth
	# brew cask install --appdir="/Applications" chromecast


## Nice to have
echo 'Install Some additional Apps...'
	brew cask install --appdir="/Applications" skype
	brew cask install --appdir="/Applications" tunnelbear
	brew cask install --appdir="/Applications" slack
	brew cask install --appdir="/Applications" grammarly
	brew cask install --appdir="/Applications" kodi
	brew cask install --appdir="/Applications" spotify
	# brew cask install --appdir="/Applications" spotify-notifications
	# brew cask install --appdir="/Applications" firefox
	# brew cask install --appdir="/Applications" jdownloader
	# brew cask install --appdir="/Applications" lastfm
	# brew cask install --appdir="/Applications" all2mp3
	# Link Cask Apps to --appdir="/Applications" Alfred
	# brew cask alfred --appdir="/Applications" link


## cleanup
echo 'Cleanup'
	heineken


## Apps to Dock
echo 'Adding some Apps to dock...'
	defaults write com.apple.dock persistent-apps -array-add \
		'<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string> \
		/Applications/Google Chrome.app \
		</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
	defaults write com.apple.dock persistent-apps -array-add \
		'<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string> \
		/Applications/Sublime Text.app \
		</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
	defaults write com.apple.dock persistent-apps -array-add \
		'<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string> \
		/Applications/Spotify.app \
		</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
	defaults write com.apple.dock persistent-apps -array-add \
		'<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string> \
		/Applications/zoom.us.app \
		</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
	# defaults write com.apple.dock persistent-apps -array-add \
	# 	'<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string> \
	# 	/Applications/TunnelBear.app \
	# 	</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

	killall Dock
