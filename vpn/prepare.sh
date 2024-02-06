sudo apt update
sudo apt install -y docker.io docker-compose "linux-headers-$(uname -r)"
sudo echo "[Resolve]" | sudo tee /etc/systemd/resolved.conf
sudo echo "DNS=1.1.1.1,8.8.8.8" | sudo tee -a /etc/systemd/resolved.conf
sudo echo "DNSStubListener=no" | sudo tee -a /etc/systemd/resolved.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
