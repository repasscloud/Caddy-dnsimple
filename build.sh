#!/usr/bin/env sh

# install go1.22.3
wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.22.3.linux-amd64.tar.gz
rm -rf go1.22.3.linux-amd64.tar.gz

# Update path
export PATH=$PATH:/usr/local/go/bin

# Check go version
go version

# Install xcaddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-xcaddy-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-xcaddy.list
sudo apt update
sudo apt install xcaddy

# get latest caddy main.go file
wget https://raw.githubusercontent.com/caddyserver/caddy/master/cmd/caddy/main.go

# add dnsimple plugin
sed -i '/_ "github.com\/caddyserver\/caddy\/v2\/modules\/standard"/a\ \t_ "github.com/caddy-dns/dnsimple"' main.go

# show me the contents
cat main.go
