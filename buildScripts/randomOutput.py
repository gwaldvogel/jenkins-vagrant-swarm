#!/usr/bin/env python3
import time
import hashlib

START = time.time()

# 4 * 4 * 1024 * 5 iterations:
# 64 chars per hash * 4 byte/character = 256b
# 256b * 4 = 1kb
# 1kb * 1024 = 1mb
# 1mb * 5 = 5mb output
for i in range(0, (4*4*1024*5)):
    print(hashlib.sha256(str(time.time()).encode('utf-8')).hexdigest())

