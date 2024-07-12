# this script assumes you have already gone through standard system setup
# in addition, you'll need to log in to the app store for MAS to work
# you should also create or copy over your ssh keys
# ssh keys should have 0600 permissions

# before you do anything else, do a system backup

# to run: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/thatrandybrown/bootstrap/main/bootstrap.sh)" "url_for_brew_file"

echo "Bootstrapping your mac"

# install homebrew
echo "Installing homebrew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# manage this more idempotently
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew doctor

curl $0 > ./Brewfile
brew bundle
rm ./Brewfile
rm ./Brewfile.lock.json

# sudo n latest
# sudo chown -R 501:20 ~/.npm # fix a legacy bug

mas upgrade
echo "you have the following applications installed, consider adding them to your brewfile"
mas list

# setup rust
rustup-init -y

# setup git
# this should eventually be a part of dotfiles and pulled from there instead
# git config --global user.name "Randy Brown"
# git config --global user.email thatrandybrown@gmail.com
# git config --global init.defaultBranch main
# git config --list --show-origin

# make code dir
mkdir -p ~/Craft

# change safari to use private mode by default

# change where screenshots are saved
mkdir -p ~/Screenshots
zsh -c "defaults write com.apple.screencapture location ~/Screenshots"
