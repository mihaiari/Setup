#Ask for user permissions
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Give permissions to the user local folder
sudo chown -R `whoami` /usr/local

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"\

#Set zsh theme to ys
sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' ~/.zshrc

#Change shell to zsh for iterm
chsh -s $(which zsh)
sudo chsh -s $(which zsh)

#Create the Clones & Projects folder
cd ~
mkdir Projects
mkdir Clones

#Install n
cd ~/Clones/
git clone https://github.com/tj/n.git
cd n/
make install

#Install z
cd ~/Clones/
git clone https://github.com/rupa/z.git
cd z/
make install

echo "#Path to z" >> ~/.zshrc
echo ". $HOME/Clones/z/z.sh" >> ~/.zshrc

#Install thefuck
brew install thefuck

echo "#Config the fuck out" >> ~/.zshrc
echo "eval \"$(thefuck --alias)\"" >> ~/.zshrcc
echo "eval \"$(thefuck --alias FUCK)\"" >> ~/.zshrcc

#Install node
n stable
n latest

#Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo -n "Enter your github acces token [ENTER]: "
read token

echo "#Homebrew GitHub access token" >> ~/.zshrc
echo "export HOMEBREW_GITHUB_API_TOKEN=$token" >> ~/.zshrc

#Update brew
brew update
brew upgrade --all
brew doctor

#Install homebrew cask
brew install caskroom/cask/brew-cask

#Install utils
brew install wget
brew tap homebrew/versions
brew tap caskroom/versions

#Install applications
brew cask install iterm2
brew cask install slack
brew cask install spectacle

#Install browsers
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox

#Install editors
brew cask atom
brew cask sublime-text

#Install docker
brew cask install dockertoolbox

#The end
brew cleanup
source ~/.zshrc
