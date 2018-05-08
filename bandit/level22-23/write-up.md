Open `/etc/cron.d/cronjob_bandit23`, we see:
```
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
```
Accordingly, open `/usr/bin/cronjob_bandit23.sh`, we see:
```
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

```
From this script, we understand that the password to bandit23 is cat into a file in `/tmp` directory. This file's name is `md5` hash of the string `I am user bandit23` since `$myname` is the username of whoever run this script, which should be `bandit23` as we desire.

If we naively run the script, we can only get the filename that contains password for `bandit22` since we are currently running as `bandit22` and obviously cannot switch to `bandit23` (hell, if we can then we no longer need to seek for password!). To get the password of `bandit23`, we run the same hash command in the script but substitude `$myname` by `bandit23`
```
bandit22@bandit:~$ echo I am user bandit23 | md5sum | cut -d ' ' -f 1
8ca319486bfbbc3663ea0fbe81326349
```
This gives us the us the file name `8ca319486bfbbc3663ea0fbe81326349` in `/tmp` that contains password for `bandit23`. Now we just `cat` the content of this exact file out:
```
bandit22@bandit:~$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
```
There we go, the password is `jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n`
