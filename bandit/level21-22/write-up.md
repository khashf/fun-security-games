Explore the said cron job
```
cat /etc/cron.d/
cat /usr/bin/cronjob_bandit22.sh
```
Discovered that it `cat` password to a file in the `/tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv` file where it uses `chmod` to let us have `read` permission, so
```
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
```
