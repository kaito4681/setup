# ubuntu setup

## 大学 proxy

```sh
echo "shell"
echo 'export http_proxy="http://ufproxy.b.cii.u-fukui.ac.jp:8080"' >> ~/.bashrc
echo 'export no_proxy="localhost,127.0.0.1"' >> ~/.bashrc
source ~/.bashrc
echo "apt"
echo 'Acquire::http::Proxy "http://ufproxy.b.cii.u-fukui.ac.jp:8080";' | sudo tee -a /etc/apt/apt.conf
echo 'Acquire::https::Proxy "http://ufproxy.b.cii.u-fukui.ac.jp:8080";' | sudo tee -a /etc/apt/apt.conf
```

## apt

```sh
sudo apt install git curl vim
```

## tailscale

[https://tailscale.com/download/linux](https://tailscale.com/download/linux)

```sh
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale
sudo tailscale up
```

ブラウザで許可

## ssh

```
sudo apt install openssh-server
```

## remote desktop

```sh
sudo apt install xrdp
sudo usermod -aG ssl-cert xrdp
sudo apt install xfce4
```

```sh
echo "startxfce4" > ~/.xsession
```

```sh
sudo vim /etc/gdm3/custom.conf
```
WaylandEnable=falseをコメントアウト

chrome desktopの場合
```sh
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo groupadd chrome-remote-desktop
sudo usermod -a -G chrome-remote-desktop $USER
```

