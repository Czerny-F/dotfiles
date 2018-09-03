# dotfiles

## Vim

```sh
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

ln -s ~/dotfiles/vimrc .vimrc

mkdir -p ~/.vim/syntax
cd ~/.vim/syntax
ln -s ~/dotfiles/htmljinja.vim
ln -s ~/dotfiles/jinja.vim

# pip3 install --user flake8
mkdir -p ~/.config
cd ~/.config
ln -s ~/dotfiles/flake8
```
