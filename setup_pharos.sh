#!/bin/bash

# Judul
echo "=============================================="
echo "  Pharos Testnet Bot Automation Script"
echo "  By Everlex Airdrop"
echo "  Join Channel : https://t.me/EverlexAirdrop"
echo "=============================================="
echo ""

# Fungsi untuk install bot
install_bot() {
    echo "Memulai instalasi Pharos Testnet Bot..."
    echo
    
    # Clone repository
    git clone --filter=blob:none --no-checkout https://github.com/LutfiDAdi/Pharos-Testnet-Bot
    cd Pharos-Testnet-Bot
    git sparse-checkout init --no-cone
    git sparse-checkout set --no-cone "/*" "!/setup_pharos.sh"
    git checkout main
    
    # Install dependencies
    echo "Menginstal dependensi..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y nodejs
    sudo npm install -g yarn
    npm install dotenv ethers https-proxy-agent random-useragent axios
    
    echo
    echo "Instalasi selesai!"
    cd ..
}

# Fungsi untuk konfigurasi .env
setup_env() {
    echo "Konfigurasi file .env"
    echo "Format yang digunakan:"
    echo "PRIVATE_KEY_1=private_key_pertama_anda_disini"
    echo "PRIVATE_KEY_2=private_key_kedua_anda_disini"
    echo
    
    if [ -f "Pharos-Testnet-Bot/.env" ]; then
        echo "File .env sudah ada. Ingin melihat isinya? (y/n)"
        read view_env
        if [ "$view_env" = "y" ]; then
            nano Pharos-Testnet-Bot/.env
        fi
    else
        nano Pharos-Testnet-Bot/.env
    fi
}

# Fungsi untuk konfigurasi proxy
setup_proxy() {
    echo "Konfigurasi file proxies.txt"
    echo "Format yang digunakan:"
    echo "http://user:pass@ip:port"
    echo "socks5://user:pass@ip:port"
    echo
    
    if [ -f "Pharos-Testnet-Bot/proxies.txt" ]; then
        echo "File proxies.txt sudah ada. Ingin melihat isinya? (y/n)"
        read view_proxy
        if [ "$view_proxy" = "y" ]; then
            nano Pharos-Testnet-Bot/proxies.txt
        fi
    else
        nano Pharos-Testnet-Bot/proxies.txt
    fi
}

# Fungsi untuk menjalankan bot
run_bot() {
    echo "Menjalankan Pharos Testnet Bot..."
    cd Pharos-Testnet-Bot
    screen -S Pharos -dm node main.js
    echo "Bot berjalan di screen 'Pharos'"
    echo "Gunakan 'screen -r Pharos' untuk melihat output"
    echo "Tekan Ctrl+A+D untuk keluar dari screen"
    cd ..
}

# Fungsi untuk menghentikan bot
stop_bot() {
    echo "Menghentikan Pharos Testnet Bot..."
    screen -XS Pharos quit
    echo "Bot telah dihentikan"
}

# Fungsi untuk uninstall bot
uninstall_bot() {
    echo "Menghapus Pharos Testnet Bot..."
    screen -XS Pharos quit
    rm -rf Pharos-Testnet-Bot
    echo "Bot telah dihapus"
}

# Menu utama
while true; do
    echo
    echo "PILIH TINDAKAN:"
    echo "1) Install Bot"
    echo "2) Konfigurasi .env"
    echo "3) Konfigurasi Proxy"
    echo "4) Jalankan Bot"
    echo "5) Hentikan Bot"
    echo "6) Lihat Output Bot"
    echo "7) Hapus Bot"
    echo "8) Keluar"
    echo
    read -p "Masukkan pilihan (1-8): " choice

    case $choice in
        1) install_bot ;;
        2) setup_env ;;
        3) setup_proxy ;;
        4) run_bot ;;
        5) stop_bot ;;
        6) screen -r Pharos ;;
        7) uninstall_bot ;;
        8) exit 0 ;;
        *) echo "Pilihan tidak valid!" ;;
    esac
done
