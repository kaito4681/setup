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
sudo apt install xrdp xorgxrdp gdm3
```

```sh
sudo sed -i 's/^#?WaylandEnable=.*/WaylandEnable=false/' /etc/gdm3/custom.conf
sudo systemctl restart gdm3
```

```sh
sudo chown "$USER":"$USER" ~/.Xauthority 2>/dev/null || true
sudo chmod 600 ~/.Xauthority 2>/dev/null || true
sudo systemctl restart xrdp gdm3
```

```sh
echo 'export DESKTOP_SESSION=ubuntu' > ~/.xsession
echo 'export XDG_CURRENT_DESKTOP=GNOME' >> ~/.xsession
echo 'exec dbus-run-session -- gnome-session --session=ubuntu' >> ~/.xsession
```

chrome desktopの場合
```sh
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo groupadd chrome-remote-desktop
sudo usermod -a -G chrome-remote-desktop $USER
```

## zsh
```sh
sudo apt install zsh
chsh -s /use/bin/zsh
```

## brew
[https://docs.brew.sh/Homebrew-on-Linux#:~:text=the%20Homebrew%20prefix.-,Requirements,-See%20Support%20Tiers](https://docs.brew.sh/Homebrew-on-Linux#:~:text=the%20Homebrew%20prefix.-,Requirements,-See%20Support%20Tiers)
```
sudo apt-get install build-essential procps curl file git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## mise
[https://mise.jdx.dev/getting-started.html](https://mise.jdx.dev/getting-started.html)
```sh
sudo apt update -y && sudo apt install -y gpg sudo wget curl
sudo install -dm 755 /etc/apt/keyrings
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
sudo apt update
sudo apt install -y mise
```

```sh
mise use --global python@3.13
mise use --global node@22
```


## uv
[https://docs.astral.sh/uv/#highlights](https://docs.astral.sh/uv/#highlights)

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

```sh
uv tool install ruff ty
```

## bun
[https://bun.com/get](https://bun.com/get)

```sh
curl -fsSL https://bun.sh/install | bash
```

```sh
bun install -g @google/gemini-cli
```
