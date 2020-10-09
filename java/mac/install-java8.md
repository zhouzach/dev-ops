
https://stackoverflow.com/questions/24342886/how-to-install-java-8-on-mac

brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk/openjdk/adoptopenjdk8


To install the JDKs from AdoptOpenJDK:

brew tap adoptopenjdk/openjdk

brew cask install adoptopenjdk8
brew cask install adoptopenjdk9
brew cask install adoptopenjdk10
brew cask install adoptopenjdk11



For those who don't want to run through the details, here is a summary:

# To install JDK8
brew cask install adoptopenjdk/openjdk/adoptopenjdk8

# To be able to safely run 'brew cleanup'
brew untap adoptopenjdk/openjdk
brew untap caskroom/versions
brew cleanup