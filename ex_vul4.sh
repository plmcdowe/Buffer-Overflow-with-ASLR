#!/bin/bash

for corefile in core.vulnerable4.*; do
    echo "Processing $corefile..."

address=$(sudo gdb -q -ex "core-file $corefile" -ex "find /w 0xbfff7b00, 0xbfff8080, 0x90909090, 0x90909090, 0x90909090, 0x90909090" -ex "quit" ./vulnerable4 2>&1 | grep "0x")

    if [ -n "$address" ]; then
        #echo "Found NOP sequence at: $address"
        echo "$address" >> gdb.txt
    else
        echo "NOP sequence not found in $corefile"
    fi

done
