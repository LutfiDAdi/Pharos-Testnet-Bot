#!/bin/bash

# Judul
echo "=============================================="
echo "  Pharos Testnet Bot Automation Script"
echo "  By Everlex Airdrop"
echo "  Join Channel : https://t.me/EverlexAirdrop"
echo "=============================================="
echo ""

function tampilkan_menu() {
    clear
    echo "===================================="
    echo "      MANAJER BOT PHAROS TESTNET     "
    echo "===================================="
    echo "1. Pasang dan Setup Bot Pharos"
    echo "2. Edit file .env (private key)"
    echo "3. Edit proxies.txt"
    echo "4. Mulai Bot Pharos"
    echo "5. Lihat sesi bot yang berjalan"
    echo "6. Hapus Bot Pharos"
    echo "7. Keluar"
    echo "===================================="
    echo -n "Silakan pilih opsi [1-7]: "
}

function pasang_bot() {
    echo "Memasang Bot Pharos Testnet..."
    
    # Clone repository dengan filter
    git clone --filter=blob:none --no-checkout https://github.com/LutfiDAdi/Pharos-Testnet-Bot
    cd Pharos-Testnet-Bot || exit
    
    # Setup sparse checkout
    git sparse-checkout init --no-cone
    git sparse-checkout set --no-cone "/*" "!/setup_pharos.sh"
    git checkout main
    
    # Pasang dependensi
    sudo apt update && sudo apt install -y nodejs npm
    npm install -g yarn
    npm install dotenv ethers https-proxy-agent random-useragent axios
    
    echo "Pemasangan selesai!"
    cd ..
    read -p "Tekan [Enter] untuk kembali ke menu..."
}

function edit_env() {
    echo "Mengedit file .env..."
    
    if [ -f "Pharos-Testnet-Bot/.env" ]; then
        nano "Pharos-Testnet-Bot/.env"
    else
        echo "Membuat file .env baru..."
        echo "PVT_KEY=masukkan_private_key_anda_disini" > "Pharos-Testnet-Bot/.env"
        nano "Pharos-Testnet-Bot/.env"
    fi
    
    read -p "Tekan [Enter] untuk kembali ke menu..."
}

function edit_proxies() {
    echo "Mengedit proxies.txt..."
    
    if [ -f "Pharos-Testnet-Bot/proxies.txt" ]; then
        nano "Pharos-Testnet-Bot/proxies.txt"
    else
        echo "Membuat file proxies.txt baru..."
        echo "# Tambahkan proxy Anda dengan format: http://user:pass@ip:port" > "Pharos-Testnet-Bot/proxies.txt"
        nano "Pharos-Testnet-Bot/proxies.txt"
    fi
    
    read -p "Tekan [Enter] untuk kembali ke menu..."
}

function mulai_bot() {
    echo "Memulai Bot Pharos di sesi screen..."
    
    if [ ! -d "Pharos-Testnet-Bot" ]; then
        echo "Direktori Pharos-Testnet-Bot tidak ditemukan. Silakan pasang terlebih dahulu."
        read -p "Tekan [Enter] untuk kembali ke menu..."
        return
    fi
    
    screen -S Pharos -dm bash -c "cd Pharos-Testnet-Bot && node main.js"
    
    echo "Bot telah dimulai di sesi screen. Gunakan opsi 5 untuk melihat sesi."
    read -p "Tekan [Enter] untuk kembali ke menu..."
}

function lihat_sesi() {
    echo "Mengakses sesi screen Bot Pharos..."
    echo "Catatan: Tekan Ctrl+A lalu D untuk keluar tanpa menghentikan bot"
    sleep 2
    screen -r Pharos
}

function hapus_bot() {
    echo "Menghapus Bot Pharos Testnet..."
    if [ -d "Pharos-Testnet-Bot" ]; then
        rm -rf Pharos-Testnet-Bot
        echo "Direktori Pharos-Testnet-Bot telah dihapus."
    else
        echo "Direktori Pharos-Testnet-Bot tidak ditemukan."
    fi
    read -p "Tekan [Enter] untuk kembali ke menu..."
}

# Loop utama program
while true; do
    tampilkan_menu
    read -r pilihan
    
    case $pilihan in
        1) pasang_bot ;;
        2) edit_env ;;
        3) edit_proxies ;;
        4) mulai_bot ;;
        5) lihat_sesi ;;
        6) hapus_bot ;;
        7) echo "Keluar..."; exit 0 ;;
        *) echo "Opsi tidak valid. Silakan coba lagi."; sleep 2 ;;
    esac
done
