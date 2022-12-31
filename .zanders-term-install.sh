# DETERMINE OS
if [ "$(uname)" = "Darwin" ]; then
  OS="OSX"
elif [ -f /etc/lsb-release ] && [ "$(grep -Ei 'debian|ubuntu' /etc/lsb-release)" ]; then
  OS="LINUX_DEBIAN"
elif [ -f /etc/redhat-release ] && [ "$(grep -Ei 'red hat|centos' /etc/redhat-release)" ]; then
  OS="LINUX_REDHAT"
fi

# EXECUTE OSX INSTALLS
echo "EXECUTING ${OS} INSTALL"
if [ "$OS" = "OSX" ]; then

  # INSTALL HOMEBREW
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null
  brew install vi
  brew install git

  # INSTALL OH MY ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# EXECUTE DEBIAN LINUX INSTALLS
elif [ "$OS" = "LINUX_DEBIAN" ]; then

  # INSTALL HOMEBREW
  apt-get install build-essential procps curl file git -y
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
  brew install vi
  brew install git

  # INSTALL OH MY ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

elif [ "$OS" = "LINUX_REDHAT" ]; then

  # INSTALL HOMEBREW
  yum groupinstall 'Development Tools' -y
  yum install procps-ng curl file git -y
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
  brew install vi
  brew install git

  # INSTALL OH MY ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fi