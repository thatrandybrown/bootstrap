# this script assumes you have already gone through standard system setup
# you should also create or copy over your ssh keys

# before you do anything else, do a system backup
# download this script and run the following commands from the terminal

# cd Downloads
# chmod +x bootstrap.sh
# ./bootstrap.sh

echo "Bootstrapping your mac"

# install homebrew
echo "Installing homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' > ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew doctor

# install docker
echo "Installing docker"
brew install docker --cask

# change safari to use private mode by default