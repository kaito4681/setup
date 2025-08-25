# ubuntu setup

## 大学 proxy

```sh
echo 'export http_proxy="http://ufproxy.b.cii.u-fukui.ac.jp:8080"' >> ~/.bashrc
echo 'export no_proxy="localhost,127.0.0.1"' >> ~/.bashrc
source ~/.bashrc
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

設定アプリ > system > remote desktop > remote login をオンにする  
繋いでみて，Error code 0x207なら，exportしてrdpファイルを以下のように修正
```diff
- use redirection server name:i:0
+ use redirection server name:i:1
```
（末尾の 0 を 1へ変更）

## zsh
```sh
sudo apt install zsh
chsh -s /use/bin/zsh
```
反映しなければ再起動

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

## ufw

### tailscaleのみからしかアクセスできないように

[https://tailscale.com/kb/1077/secure-server-ubuntu#step-5-restrict-all-other-traffic](https://tailscale.com/kb/1077/secure-server-ubuntu#step-5-restrict-all-other-traffic)

```sh
sudo ufw enable
sudo ufw default deny
sudo ufw reload
sudo ufw allow in on tailscale0

sudo ufw reload
sudo service ssh restart
```



###　tailscale subnet

[https://tailscale.com/kb/1019/subnets#use-your-subnet-routes-from-other-devices](https://tailscale.com/kb/1019/subnets#use-your-subnet-routes-from-other-devices)

```sh
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

# 例：sudo tailscale set --advertise-routes=10.0.87.0/24;
sudo tailscale set --advertise-routes="subnet routesをここに入れる";
sudo tailscale set --accept-routes
```



