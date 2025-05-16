# Pharos Testnet Bot

Bot otomatis untuk berinteraksi dengan Pharos Testnet, melakukan swap, transfer, klaim faucet, dan check-in harian untuk berpotensi memenuhi syarat airdrop.

## Fitur ✨

- Swap Otomatis: Melakukan swap acak antara token WPHRS dan USDC
- Transfer PHRS: Mengirim jumlah kecil PHRS ke alamat acak
- Klaim Faucet: Secara otomatis mengklaim token testnet dari faucet
- Check-in Harian: Menyelesaikan tugas check-in harian untuk potensi hadiah
- Dukungan Proxy: Menggilir proxy untuk setiap operasi (jika disediakan)
- Dukungan Multi-wallet: Memproses beberapa wallet secara berurutan

## Prasyarat 📋

- Node.js (versi 18 atau lebih tinggi)
- npm atau yarn
- Wallet Pharos Testnet dengan private key

1. Jalankan langsung:
   ```
   curl -sO https://raw.githubusercontent.com/LutfiDAdi/Pharos-Testnet-Bot/main/setup_pharos.sh
   ```
3. Contoh file .env:
   ```
   PRIVATE_KEY_1=private_key_pertama_anda_disini
   PRIVATE_KEY_2=private_key_kedua_anda_disini
   ```
4. (Opsional) Contoh proxies.txt (satu per baris):
   ```
   http://user:pass@ip:port
   socks5://user:pass@ip:port
   ```
## Catatan Penting ⚠️

1. Bot ini HANYA untuk penggunaan TESTNET
2. Jangan pernah menggunakan private key mainnet
3. Bot akan berjalan terus menerus sampai dihentikan (Ctrl+C)
4. Semua transaksi menggunakan gas price 0 (fitur testnet)
5. Bot memiliki jeda acak antara operasi

## Dukungan 💬

Untuk masalah atau pertanyaan, silakan buka issue di GitHub.

## Penafian ⚠️

Perangkat lunak ini disediakan "sebagaimana adanya" tanpa jaminan. Gunakan dengan risiko sendiri. Pengembang tidak bertanggung jawab atas kerugian atau masalah yang disebabkan oleh penggunaan bot ini.

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]()
