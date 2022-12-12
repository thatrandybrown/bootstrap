# this script assumes you have already gone through standard system setup
# you should also create or copy over your ssh keys

# before you do anything else, do a system backup

# to run: /bin/bash -c "$(curl -fsSL https://gist.githubusercontent.com/thatrandybrown/b7f85609be8a7facaa40296cf34db417/raw/9d91a73047720b6ccde599fa3fc5ee757c0980e5/bootstrap.sh)"

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

# change safari to use private mode by default