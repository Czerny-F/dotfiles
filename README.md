# dotfiles

```bash
mkdir -p .config
mkdir -p .vim/syntax

cd ~
ln -s ~/dotfiles/vimrc .vimrc
ln -s ~/dotfiles/gitconfig .gitconfig

cd ~/.config
ln -s ~/dotfiles/flake8

cd ~/.vim/syntax
ln -s ~/dotfiles/htmljinja.vim
ln -s ~/dotfiles/jinja.vim
```
