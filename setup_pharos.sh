#!/bin/bash

# Judul
echo "=============================================="
echo "  Pharos Testnet Bot Automation Script"
echo "  By Everlex Airdrop"
echo "  Join Channel : https://t.me/EverlexAirdrop"
echo "=============================================="
echo ""

# Fungsi utama
main() {
    while true; do
        echo ""
        echo "Pilih tindakan yang ingin dilakukan:"
        echo "1. Clone dan setup repository"
        echo "2. Install dependencies"
        echo "3. Edit konfigurasi (.env)"
        echo "4. Edit proxies.txt"
        echo "5. Jalankan bot"
        echo "6. Hapus repository"
        echo "7. Keluar"
        echo ""
        read -p "Masukkan pilihan (1-7): " choice

        case $choice in
            1)
                clone_repo
                ;;
            2)
                install_deps
                ;;
            3)
                edit_env
                ;;
            4)
                edit_proxies
                ;;
            5)
                run_bot
                ;;
            6)
                clean_up
                ;;
            7)
                echo "Keluar dari script..."
                exit 0
                ;;
            *)
                echo "Pilihan tidak valid, coba lagi."
                ;;
        esac
    done
}

# Fungsi clone repository
clone_repo() {
    echo "Memulai proses clone repository..."
    git clone --filter=blob:none --no-checkout https://github.com/LutfiDAdi/Pharos-Testnet-Bot
    cd Pharos-Testnet-Bot || exit
    git sparse-checkout init --no-cone
    git sparse-checkout set --no-cone "/*" "!/setup_pharos.sh"
    git checkout main
    echo "Clone repository selesai."
    cd ..
}

# Fungsi install dependencies
install_deps() {
    echo "Memulai instalasi dependencies..."
    cd Pharos-Testnet-Bot || { echo "Directory Pharos-Testnet-Bot tidak ditemukan"; return; }
    npm install dotenv ethers https-proxy-agent random-useragent axios
    echo "Instalasi dependencies selesai."
    cd ..
}

# Fungsi edit .env
edit_env() {
    echo "Membuka editor untuk .env..."
    cd Pharos-Testnet-Bot || { echo "Directory Pharos-Testnet-Bot tidak ditemukan"; return; }
    nano .env
    cd ..
}

# Fungsi edit proxies.txt
edit_proxies() {
    echo "Membuka editor untuk proxies.txt..."
    cd Pharos-Testnet-Bot || { echo "Directory Pharos-Testnet-Bot tidak ditemukan"; return; }
    nano proxies.txt
    cd ..
}

# Fungsi jalankan bot
run_bot() {
    echo "Menjalankan bot..."
    cd Pharos-Testnet-Bot || { echo "Directory Pharos-Testnet-Bot tidak ditemukan"; return; }
    screen -S Pharos -dm node main.js
    echo "Bot berhasil dijalankan di screen 'Pharos'."
    echo "Gunakan 'screen -r Pharos' untuk melihat proses."
    echo "Tekan Ctrl+A+D untuk keluar dari screen."
    cd ..
}

# Fungsi clean up
clean_up() {
    read -p "Apakah Anda yakin ingin menghapus repository? (y/n): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        rm -rf Pharos-Testnet-Bot
        echo "Repository berhasil dihapus."
    else
        echo "Penghapusan repository dibatalkan."
    fi
}

# Jalankan fungsi utama
main
