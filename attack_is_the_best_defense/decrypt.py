#!/usr/bin/python3
import base64


# Base64-encoded string
encoded_string = "bXlwYXNzd29yZDk4OTgh"

# Decode the Base64-encoded string
decoded_bytes = base64.b64decode(encoded_string)

# Convert the bytes to a string
decoded_string = decoded_bytes.decode('utf-8')

# Print the decoded string
print(decoded_string)
