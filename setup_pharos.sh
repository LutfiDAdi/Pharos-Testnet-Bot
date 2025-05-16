#!/bin/bash

# Judul
echo "=============================================="
echo "  Pharos Testnet Bot Automation Script"
echo "  By Everlex Airdrop"
echo "  Join Channel : https://t.me/EverlexAirdrop"
echo "=============================================="
echo ""

# Fungsi untuk menginstall bot
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
    echo "Menginstall dependencies..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install nodejs -y
    npm install -g yarn
    npm install dotenv ethers https-proxy-agent random-useragent axios
    
    # Setup environment
    echo "Silahkan edit file .env dan proxies.txt"
    echo "Gunakan nano atau editor teks lainnya"
    echo "File yang perlu diisi:"
    echo "1. .env"
    echo "2. proxies.txt"
    echo
}

# Fungsi untuk menjalankan bot
run_bot() {
    echo "Menjalankan Pharos Testnet Bot..."
    cd Pharos-Testnet-Bot
    screen -S Pharos -dm node main.js
    echo "Bot berjalan di screen dengan nama 'Pharos'"
    echo "Untuk keluar dari screen: tekan Ctrl+A kemudian D"
    echo "Untuk kembali ke screen: screen -r Pharos"
    echo
}

# Fungsi untuk menghentikan bot
stop_bot() {
    echo "Menghentikan Pharos Testnet Bot..."
    screen -XS Pharos quit
    echo "Bot telah dihentikan"
    echo
}

# Fungsi untuk menghapus bot
uninstall_bot() {
    echo "Menghapus Pharos Testnet Bot..."
    rm -rf Pharos-Testnet-Bot
    echo "Bot telah dihapus"
    echo
}

# Menu utama
while true; do
    echo "PILIHAN:"
    echo "1) Install Pharos Testnet Bot"
    echo "2) Jalankan Bot"
    echo "3) Hentikan Bot"
    echo "4) Hapus Bot"
    echo "5) Keluar"
    echo
    read -p "Masukkan pilihan (1-5): " choice
    echo
    
    case $choice in
        1) install_bot ;;
        2) run_bot ;;
        3) stop_bot ;;
        4) uninstall_bot ;;
        5) echo "Keluar dari script. Terima kasih!"; exit 0 ;;
        *) echo "Pilihan tidak valid. Silahkan coba lagi." ;;
    esac
    
    echo
done
