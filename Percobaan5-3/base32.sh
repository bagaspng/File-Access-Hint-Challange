#!/bin/bash
# Script sederhana untuk Base32 Encode/Decode
# Pemakaian:
#   ./base32.sh encode <input_file> > output_file
#   ./base32.sh decode <input_file> > output_file

# cek argumen
if [ $# -lt 2 ]; then
    echo "Usage: $0 {encode|decode} <input_file>"
    exit 1
fi

MODE=$1
INPUT=$2

if [ ! -f "$INPUT" ]; then
    echo "Error: File '$INPUT' tidak ditemukan."
    exit 1
fi

case $MODE in
    encode)
        base32 "$INPUT"
        ;;
    decode)
        base32 -d "$INPUT"
        ;;
    *)
        echo "Mode tidak dikenal: $MODE"
        echo "Gunakan: encode | decode"
        exit 1
        ;;
esac
