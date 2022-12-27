# this script assumes you have already gone through standard system setup
# you should also create or copy over your ssh keys
# ssh keys should have 0600 permissions

# before you do anything else, do a system backup

# to run: /bin/bash -c "$(curl -fsSL $PATH_TO_RAW/bootstrap.sh)"

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

# install zoom
echo "Installing zoom"
brew install zoom --cask

# install vscode
echo "Installing vscode"
brew install visual-studio-code --cask

# install n
brew install n
# sudo n latest
# sudo chown -R 501:20 ~/.npm # fix a legacy bug

# install mas for managing mac store apps
brew install mas

# setup git
# this should eventually be a part of dotfiles and pulled from there instead
# git config --global user.name "Randy Brown"
# git config --global user.email thatrandybrown@gmail.com
# git config --global init.defaultBranch main

# make code dir
mkdir -p ~/code && cd code

# change safari to use private mode by default