
https://collabnix.com/how-to-install-and-configure-nvm-on-mac-os/

Install nvm
Once you have Homebrew installed, you can use it to install nvm by running the following command:

brew install nvm
Add nvm to your shell profile: To make nvm available every time you open a new terminal window, you will need to add the following line to your shell profile (e.g., ~/.bash_profile or ~/.zshrc):

source $(brew --prefix nvm)/nvm.sh
Install Node.js
Once nvm is installed, you can use it to install the latest version of Node.js by running the following command:

nvm install node