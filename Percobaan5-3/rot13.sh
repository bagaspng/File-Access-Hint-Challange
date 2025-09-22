#!/bin/bash
# Script ROT13 sederhana
# Pemakaian:
#   ./rot13.sh encode input.txt > output.txt
#   ./rot13.sh decode input.txt > output.txt
#
# Catatan: ROT13 itu simetris → encode = decode.

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

# ROT13 bisa dilakukan dengan tr
tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$INPUT"
