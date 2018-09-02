# dotfiles

```bash
cd ~

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

mkdir -p .config
mkdir -p .vim/syntax

git clone git@github.com:Czerny-F/dotfiles.git
pushd dotfiles
git checkout isucon
popd

ln -s ~/dotfiles/vimrc .vimrc
ln -s ~/dotfiles/gitconfig .gitconfig

cd ~/.config
ln -s ~/dotfiles/flake8

cd ~/.vim/syntax
ln -s ~/dotfiles/htmljinja.vim
ln -s ~/dotfiles/jinja.vim
```
