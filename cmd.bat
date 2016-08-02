c:
cd %userprofile%\Desktop
openssl pkcs8 -topk8 -inform PEM -in rsa_p_k.pem -outform PEM -nocrypt -out pkcs8.pem