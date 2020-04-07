# Emacs config for mac/linux


this is the latest one...


## Before use

```bash
# for markdown preview
# ref: https://github.com/shime/emacs-livedown
sudo npm install -g livedown


# for golang lsp
go get golang.org/x/tools/gopls@latest

# go go-guru
go get -u golang.org/x/tools/cmd/guru

# golang tags
go get github.com/fatih/gomodifytags

# for aspell
sudo pacman -S aspell-en


# for markdown
sudo pacman -S pandoc

# for envs
touch ~/.zshenv

# add envs (GOPROXY...) to zshenv

```



## After start

```bash
# for company-TabNine

M-x company-tabnine-install-binary

```


## Issues

1. upgrade packages regularly
2. re-install packages
