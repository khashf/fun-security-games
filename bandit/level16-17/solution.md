nmap -p31000-32000 -T4 localhost
nmap -sV --version-light -p31790 -T4 localhost
openssl s_client -connect localhost:31790 -quiet
