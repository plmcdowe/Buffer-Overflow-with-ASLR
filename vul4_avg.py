import itertools
import re

addr=[]

with open('gdb.txt') as f:
    text = f.read()
    findadder=re.findall(r'(^0xbfff.*)', text, re.M)
    for a in findadder:
        #if a not in addr:
        addr.append(a)
print(addr)

int_values = [int(a, 16) for a in addr]
average = sum(int_values) / len(int_values)
average_hex = hex(int(average))
print(average_hex)
