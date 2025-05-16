#!/bin/bash

# Judul
echo "=============================================="
echo "  Pharos Testnet Bot Automation Script"
echo "  By Everlex Airdrop"
echo "  Join Channel : https://t.me/EverlexAirdrop"
echo "=============================================="
echo ""

while true; do
    # Menu pilihan
    echo "Pilih tindakan yang ingin dilakukan:"
    echo "1) Clone dan setup repository"
    echo "2) Install dependencies"
    echo "3) Edit file .env"
    echo "4) Edit file proxies.txt"
    echo "5) Jalankan bot"
    echo "6) Hapus repository"
    echo "7) Keluar"
    echo
    read -p "Masukkan pilihan (1-7): " choice
    echo

    case $choice in
        1)
            echo "Mengclone repository..."
            git clone --filter=blob:none --no-checkout https://github.com/LutfiDAdi/Pharos-Testnet-Bot
            cd Pharos-Testnet-Bot
            git sparse-checkout init --no-cone
            git sparse-checkout set --no-cone "/*" "!/setup_pharos.sh"
            git checkout main
            cd ..
            echo "Repository berhasil di-clone."
            ;;
        2)
            echo "Menginstall dependencies..."
            sudo apt update && sudo apt upgrade -y
            sudo apt install nodejs -y
            npm install -g yarn
            cd Pharos-Testnet-Bot
            npm install dotenv ethers https-proxy-agent random-useragent axios
            cd ..
            echo "Dependencies berhasil diinstall."
            ;;
        3)
            echo "Mengedit file .env..."
            if [ -f "Pharos-Testnet-Bot/.env" ]; then
                nano Pharos-Testnet-Bot/.env
            else
                echo "Membuat file .env baru..."
                echo "PV_KEY=masukkan_private_key_anda_disini" > Pharos-Testnet-Bot/.env
                nano Pharos-Testnet-Bot/.env
            fi
            ;;
        4)
            echo "Mengedit file proxies.txt..."
            if [ -f "Pharos-Testnet-Bot/proxies.txt" ]; then
                nano Pharos-Testnet-Bot/proxies.txt
            else
                echo "Membuat file proxies.txt baru..."
                touch Pharos-Testnet-Bot/proxies.txt
                nano Pharos-Testnet-Bot/proxies.txt
            fi
            ;;
        5)
            echo "Menjalankan bot..."
            if [ -d "Pharos-Testnet-Bot" ]; then
                screen -S Pharos -dm bash -c "cd Pharos-Testnet-Bot && node main.js"
                echo "Bot berjalan di screen session 'Pharos'."
                echo "Gunakan 'screen -r Pharos' untuk melihat session."
                echo "Tekan Ctrl+A kemudian D untuk keluar dari screen session."
            else
                echo "Error: Repository Pharos-Testnet-Bot tidak ditemukan."
            fi
            ;;
        6)
            echo "Menghapus repository..."
            if [ -d "Pharos-Testnet-Bot" ]; then
                rm -rf Pharos-Testnet-Bot
                echo "Repository berhasil dihapus."
            else
                echo "Repository tidak ditemukan."
            fi
            ;;
        7)
            echo "Keluar dari script."
            exit 0
            ;;
        *)
            echo "Pilihan tidak valid. Silakan pilih 1-7."
            ;;
    esac
    
    echo
    read -p "Tekan Enter untuk melanjutkan..."
    clear
done
