	#!/bin/bash
echo -e "\033[1;32m[+] Installing Blackx AI Core...\033[0m"
pkg update -y && pkg upgrade -y
pkg install git wget curl proot -y
pkg install python python2 -y
pkg install golang openssh -y
pkg install termux-api tsu -y
pkg install root-repo x11-repo unstable-repo -y

echo "[*] Installing Evilginx2..."
pkg install golang git -y
go install github.com/kgretzky/evilginx2@latest

echo "[*] Installing Metasploit Framework..."
pkg install unstable-repo
pkg install metasploit -y

echo "[*] Setting up CLI browser (w3m)..."
pkg install w3m -y

echo "[*] Downloading Ngrok..."
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /data/data/com.termux/files/usr/etc/apt/trusted.gpg.d/ngrok.asc
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /data/data/com.termux/files/usr/etc/apt/sources.list.d/ngrok.list
pkg update && pkg install ngrok -y

echo "[*] Generating GhostRoot Stubs..."
mkdir -p ~/.ghostroot/modules
touch ~/.ghostroot/modules/fingerprint_cloak.py
echo "# Future GhostRoot cloaker module" > ~/.ghostroot/modules/fingerprint_cloak.py

echo "[*] Installing AiGod CLI Lite (Stub)..."
echo "alias aigod='echo AiGod Lite Loaded'" >> ~/.bashrc

echo -e "\033[1;32m[✓] Blackx Installer Complete. Run 'aigod' to activate AI Core.\033[0m"
