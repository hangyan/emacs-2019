# Configure mu4e/emcs on arch linux/mac


## offlineimap + notmuch + mac
```bash
brew install offlineimap
brew services start offlineimap

cp -n /usr/local/etc/offlineimap.conf.minimal ~/.offlineimaprc

# write launch plist for offlineimap
ref: https://grantlucas.com/posts/2012/10/setting-launchd-offlineimap


brew install notmuch
```


## offlineimap + mu4e + arch

### install packages


```bash
sudo pacman -S base-devel offlineimap gnutls
yay -S mu
```

### create offlineimap config file

### run offlineimap

`offlineimap`


### mu index 
`mu index --maildir=~/Maildir`
