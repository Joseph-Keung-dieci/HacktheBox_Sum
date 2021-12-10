# Title: HTB Challenge -- Flippin Bank
# Author: J0s3ph97K
# HTB link: https://app.hackthebox.com/profile/769525

"""
TODO:
    Send a cipher text contains 'admin&password=g0ld3n_b0y' after decryption but initially isn't it to server,
    by controlling cipher_1 to modify plaintext_2 to bypass the server.

XOR properties:
    1. Commutative :        A xor B = B xor A
    2. Associative :        A xor ( B xor C ) = ( A xor B ) xor C
    3. Identity element :   A xor 0 = A
    4. Self-inverse :       A xor A = 0

In Decryption Process:
    plaintext_1  =   IV       xor decrypt(cipher_1, key)
    plaintext_2  =  cipher_1  xor decrypt(cipher_2, key)
    plaintext_3  =  cipher_2  xor decrypt(cipher_3, key)
     ...
    plaintext_n  = cipher_n-1 xor decrypt(cipher_n, key)

CBC Bit-flipping Attack in the case:
    The examined block -- plaintext_2 is controlled by cipher_1 during the decryption.
    What we could do is that we xor the cipher_1 with the target byte and the modified byte,
    then we could get a cipher text that have decrypted value -- 'admin&password=g0ld3n_b0y'.
    A rule of thumb is that the byte you change in a cipher text will ONLY affect a byte at
    the same offset of next plaintext.

    ref:
        block_1: [logged_username=]
        block_2: [admin&password=g] <examined block>
        block_3: [0ld3n_b0y<pkcs7>]
"""

# login information send to the server
__username__ = 'xdmin'
__password__ = 'g0ld3n_b0y'

# flipping 'a' to 'x'
original_byte = 'a'
flipped_byte = 'x'

# block size
block_size = 32

# get from the server after sending login credential (change here)
leaked_msg = '<leaked message goes here>'

# get the first block of the cipher text
cipher_1 = leaked_msg[:block_size]

# get the ascii value of byte that we are going modify which located in the first byte of the block
cipher_first_byte = int(cipher_1[:2], 16)

# flip the bit to the one we want by xoring. ( rule: a xor a xor b = b )
cipher_first_byte_modified = cipher_first_byte ^ ord(original_byte) ^ ord(flipped_byte)

# merge the modified strings together and get the answer
cipher_1_modified = f'{cipher_first_byte_modified:02d}' + cipher_1[2:]
cipher_text_modified = cipher_1_modified + leaked_msg[block_size:]

print(cipher_text_modified)
