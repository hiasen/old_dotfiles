if [ -d ~/.oh-my-zsh ]
then
  echo "Oh my zsh is already installed"
  exit
fi

echo "Cloning oh-my-zsh-repo"
git clone https://github.com/hiasen/oh-my-zsh.git ~/.oh-my-zsh
