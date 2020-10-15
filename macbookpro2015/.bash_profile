
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
