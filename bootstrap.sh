# this script assumes you have already gone through standard system setup
# in addition, you'll need to log in to the app store for MAS to work
# you should also create or copy over your ssh keys
# ssh keys should have 0600 permissions

# before you do anything else, do a system backup

# to run: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/thatrandybrown/bootstrap/main/bootstrap.sh)"

echo "Bootstrapping your mac"

# install homebrew
echo "Installing homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' > ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew doctor

# install docker
echo "Installing docker"
brew install docker --cask

# once docker is installed, everything should probably be managed by ansible
# anything added below this line should be migrated to ansible

# install n
echo "Installing n for managing node"
brew install n
# sudo n latest
# sudo chown -R 501:20 ~/.npm # fix a legacy bug

# install terraform
echo "Installing terraform"
brew install terraform

# install aws cli
echo "installing aws cli"
brew install awscli

# install mas for managing mac store apps
echo "Installing mas to manage app store apps"
brew install mas

code --install-extension GitHub.copilot-chat --force
code --install-extension GitHub.copilot --force

# mas install onenote
echo "Installing OneNote..."
mas install 784801555
echo "You'll still need to log in to get started"

echo "Installing Screens"
mas install 1663047912
echo "You'll still need to log in to get started"

mas upgrade

echo "you have the following applications installed, consider adding them to bootstrap"
mas list

# setup git
# this should eventually be a part of dotfiles and pulled from there instead
# git config --global user.name "Randy Brown"
# git config --global user.email thatrandybrown@gmail.com
# git config --global init.defaultBranch main
# git config --list --show-origin

# make code dir
mkdir -p ~/Craft && cd ~/Craft

# change safari to use private mode by default

# change where screenshots are saved
mkdir -p ~/Screenshots
zsh -c "defaults write com.apple.screencapture location ~/Screenshots"
