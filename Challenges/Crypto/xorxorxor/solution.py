# Author: J0s3ph97K
# HTB: https://app.hackthebox.com/profile/769525


# Known information from HTB instruction
raw_flag = list(bytes.fromhex('<Given Flag>'))
known_first_4_byte = b"HTB{"
known_key_length = 4

# Retrieve the XOR key from the flag and the answer pattern: <flag> xor <'HTB{'> = key
xor_key = []
for i in range(known_key_length):
    xor_key.append(raw_flag[i] ^ known_first_4_byte[i])

# Retrieve the original flag from the xored flag and the key: <xored_flag> xor <key> = flag
flag = b''
for i in range(len(raw_flag)):
    flag += bytes([raw_flag[i] ^ xor_key[i % len(xor_key)]])

print(flag)
