nmap -A -p31000-32000 -T4 localhost
cat .bandit14.password | nc localhost 31960
