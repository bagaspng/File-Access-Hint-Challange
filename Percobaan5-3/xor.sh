#!/bin/bash
# Script XOR sederhana
# Pemakaian:
#   ./xor.sh encode input.txt key123 > output.xor
#   ./xor.sh decode input.xor key123 > hasil.txt
#
# Catatan: XOR itu simetris → encode = decode dengan kunci sama.

if [ $# -lt 3 ]; then
    echo "Usage: $0 {encode|decode} <input_file> <key>"
    exit 1
fi

MODE=$1
INPUT=$2
KEY=$3

if [ ! -f "$INPUT" ]; then
    echo "Error: File '$INPUT' tidak ditemukan."
    exit 1
fi

# Fungsi XOR: setiap byte dari input di-XOR dengan byte dari key (ulang-ulang)
perl -e '
    use strict;
    my ($file, $key) = @ARGV;
    open my $fh, "<", $file or die "Cannot open $file: $!";
    binmode $fh;
    my $data;
    read $fh, $data, -s $fh;
    close $fh;
    my $out = "";
    for (my $i = 0; $i < length($data); $i++) {
        $out .= chr(ord(substr($data,$i,1)) ^ ord(substr($key,$i % length($key),1)));
    }
    binmode STDOUT;
    print $out;
' "$INPUT" "$KEY"
