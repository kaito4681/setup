echo 'export http_proxy="http://ufproxy.b.cii.u-fukui.ac.jp:8080"' >> ~/.bashrc
echo 'export no_proxy="localhost,127.0.0.1"' >> ~/.bashrc
source ~/.bashrc

echo 'Acquire::http::Proxy "http://ufproxy.b.cii.u-fukui.ac.jp:8080";' | sudo tee -a /etc/apt/apt.conf
echo 'Acquire::https::Proxy "http://ufproxy.b.cii.u-fukui.ac.jp:8080";' | sudo tee -a /etc/apt/apt.conf