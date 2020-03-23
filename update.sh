#!/bin/zsh

FILES=(.tmux.conf .zshrc .config/i3/config)
DOTFILES_DIR=$HOME/Projetos/dotfiles/

cd $HOME
# save files 
for f in $FILES; do
  cp $f -v $DOTFILES_DIR
done

# save gnome terminal settings
echo 'saving gnome-terminal settings'
dconf dump /org/gnome/terminal/ > $DOTFILES_DIR/gnome_terminal
# save fonts
echo 'saving fonts dir'
cp -R ~/.fonts/ $DOTFILES_DIR/fonts 

cd $DOTFILES_DIR
git add .
git commit -m 'updating'
git push



